import 'package:flutter/material.dart';

class FraudAlertScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fraud Alert System'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Introduction Section
              Text(
                'Fraud Alert System',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Stay Alert and Protect Your Card from Fraudulent Activities.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/images/z1.jpg',  // Add an appropriate image in your project
                height: 200,
              ),
              SizedBox(height: 20),

              // How the System Works
              Text(
                'How the Fraud Alert System Works:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Our fraud detection system uses advanced algorithms to monitor transactions in real-time. '
                'When suspicious activity is detected, you will receive an alert instantly, helping you to take quick action.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 20),

              // Fraud Prevention Tips
              Text(
                'Steps to Take When You Receive an Alert:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '1. Verify the transaction immediately. If you don\'t recognize it, mark it as suspicious.\n'
                '2. Report the fraud to your bank or card issuer. Contact customer support directly for assistance.\n'
                '3. Lock or freeze your card temporarily to prevent further unauthorized charges.\n'
                '4. Change your account PIN and passwords as soon as possible.\n'
                '5. Regularly monitor your transaction history for signs of unusual activity.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 20),

              // Contact Information
              Text(
                'Contact Information for Reporting Fraud:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Bank Customer Support: 1-800-123-4567\n'
                'Email: fraud@yourbank.com\n'
                'Card Issuer Support: 1-800-987-6543\n'
                'Email: reportfraud@cardissuer.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 20),

              // Visual representation of fraud detection
              Image.asset(
                'assets/images/z3.jpg', // Add another image for illustration
                height: 250,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
