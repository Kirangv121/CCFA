from flask import Flask, request, jsonify
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.linear_model import LogisticRegression
import io
import base64

app = Flask(__name__)

@app.route('/upload', methods=['POST'])
def upload_file():
    if 'file' not in request.files:
        return jsonify({"error": "No file uploaded"}), 400

    file = request.files['file']
    if file.filename == '':
        return jsonify({"error": "No selected file"}), 400

    # Try reading the uploaded CSV file into a pandas DataFrame
    try:
        df = pd.read_csv(file)
    except Exception as e:
        return jsonify({"error": f"Failed to read CSV file: {str(e)}"}), 400

    # Ensure the necessary columns exist
    if 'Class' not in df.columns:
        return jsonify({"error": "CSV file must contain a 'Class' column"}), 400
    
    if 'Amount' not in df.columns:
        return jsonify({"error": "CSV file must contain an 'Amount' column"}), 400

    # Process the file (your analysis logic)
    model = LogisticRegression()
    X = df.drop('Class', axis=1)
    y = df['Class']
    
    # Ensure that all features are numeric
    if not X.apply(pd.to_numeric, errors='coerce').notnull().all().all():
        return jsonify({"error": "All features must be numeric"}), 400

    model.fit(X, y)
    predictions = model.predict(X)

    # Generate results
    fraud_transactions = df[predictions == 1]
    non_fraud_transactions = df[predictions == 0]

    # Generate Graphs
    graphs = {}

    # 1. Count plot for Fraud vs Non-Fraud Transactions
    plt.figure(figsize=(10, 6))
    sns.countplot(x=predictions)
    plt.title('Fraud vs Non-Fraud Transactions')
    plt.xlabel('Class (0: Non-Fraud, 1: Fraud)')
    plt.ylabel('Count')
    buf = io.BytesIO()
    plt.savefig(buf, format='png')
    buf.seek(0)
    graphs['fraud_vs_nonfraud'] = base64.b64encode(buf.read()).decode('utf-8')
    plt.close()

    # 2. Distribution of Transaction Amount
    plt.figure(figsize=(10, 6))
    sns.histplot(df['Amount'], kde=True, bins=30, color='blue')
    plt.title('Transaction Amount Distribution')
    plt.xlabel('Amount')
    plt.ylabel('Frequency')
    buf = io.BytesIO()
    plt.savefig(buf, format='png')
    buf.seek(0)
    graphs['amount_distribution'] = base64.b64encode(buf.read()).decode('utf-8')
    plt.close()

    # 3. Fraud Transactions Amount Distribution
    plt.figure(figsize=(10, 6))
    sns.histplot(fraud_transactions['Amount'], kde=True, bins=30, color='red')
    plt.title('Fraud Transactions - Amount Distribution')
    plt.xlabel('Amount')
    plt.ylabel('Frequency')
    buf = io.BytesIO()
    plt.savefig(buf, format='png')
    buf.seek(0)
    graphs['fraud_amount_distribution'] = base64.b64encode(buf.read()).decode('utf-8')
    plt.close()

    # 4. Non-Fraud Transactions Amount Distribution
    plt.figure(figsize=(10, 6))
    sns.histplot(non_fraud_transactions['Amount'], kde=True, bins=30, color='green')
    plt.title('Non-Fraud Transactions - Amount Distribution')
    plt.xlabel('Amount')
    plt.ylabel('Frequency')
    buf = io.BytesIO()
    plt.savefig(buf, format='png')
    buf.seek(0)
    graphs['nonfraud_amount_distribution'] = base64.b64encode(buf.read()).decode('utf-8')
    plt.close()

    # Return the JSON response with the graphs and results
    return jsonify({
        "message": "File processed successfully",
        "fraud_transactions": len(fraud_transactions),
        "non_fraud_transactions": len(non_fraud_transactions),
        "graphs": graphs  # Include all graphs as a dictionary
    })

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
