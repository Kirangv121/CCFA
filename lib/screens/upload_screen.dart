import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String _fileName = '';
  String _resultMessage = '';
  String _fraudTransactions = '';
  String _nonFraudTransactions = '';

  // Add variables to store the multiple images
  Uint8List? _fraudVsNonfraudGraph;
  Uint8List? _amountDistributionGraph;
  Uint8List? _fraudAmountGraph;
  Uint8List? _nonFraudAmountGraph;

  bool _isLoading = false;
  bool _isProcessed = false;
  bool _isHovered = false;
  
  // Function to pick a file
  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom, // Restrict to custom file types
      allowedExtensions: ['csv'], // Only allow CSV files
    );

    if (result != null) {
      setState(() {
        _fileName = result.files.single.path!; // Get the file path
      });
    }
  }

  // Function to submit the file to the Python backend
  void submitFile() async {
    if (_fileName.isNotEmpty) {
      setState(() {
        _isLoading = true; // Show loading indicator
        _isProcessed = false;
      });

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://127.0.0.1:5000/upload'), // Replace with your server's URL
      );

      var file = await http.MultipartFile.fromPath('file', _fileName);
      request.files.add(file);

      var response = await request.send();
      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseData);

        setState(() {
          _isLoading = false; // Hide loading indicator
          _isProcessed = true; // Mark the file as processed
          _resultMessage = jsonResponse['message'];
          _fraudTransactions = jsonResponse['fraud_transactions'].toString();
          _nonFraudTransactions = jsonResponse['non_fraud_transactions'].toString();

          // Decode each graph and store it for display
          _fraudVsNonfraudGraph = base64Decode(jsonResponse['graphs']['fraud_vs_nonfraud']);
          _amountDistributionGraph = base64Decode(jsonResponse['graphs']['amount_distribution']);
          _fraudAmountGraph = base64Decode(jsonResponse['graphs']['fraud_amount_distribution']);
          _nonFraudAmountGraph = base64Decode(jsonResponse['graphs']['nonfraud_amount_distribution']);
        });
      } else {
        setState(() {
          _isLoading = false; // Hide loading indicator
          _isProcessed = true;
          _resultMessage = 'Failed to process the file.';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen width to make it responsive
    double screenWidth = MediaQuery.of(context).size.width;
    double boxWidth = screenWidth < 300 ? screenWidth * 0.9 : 800; // Set box width based on screen size

    return Scaffold(
      appBar: AppBar(title: Text('Upload CSV File'), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // File picker section
              Text('Choose your CSV file', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextButton(
                  onPressed: pickFile,
                  child: Text(
                    'Upload a CSV File',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Submit button with fixed size and centered with hover effect
              Center(
                child: _isLoading
                    ? CircularProgressIndicator()
                    : MouseRegion(
                        onEnter: (_) {
                          setState(() {
                            _isHovered = true;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            _isHovered = false;
                          });
                        },
                        child: SizedBox(
                          width: 200,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: submitFile,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _isHovered ? Colors.green : Colors.orange,
                              padding: EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text('Submit', style: TextStyle(fontSize: 16, color: Colors.white)),
                          ),
                        ),
                      ),
              ),

              SizedBox(height: 20),

              // Animated processing message
                    if (_isLoading)
                Center(
                  child: AnimatedOpacity(
                    duration: Duration(seconds: 1),
                    opacity: _isLoading ? 0.8 : 1.0, // Continuously toggle opacity
                    child: Text(
                      'Please wait... Processing',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    onEnd: () {
                      if (_isLoading) {
                        setState(() {}); // Trigger re-render to repeat animation
                      }
                    },
                  ),
                ),

              // Center the result box when processed
              if (_isProcessed) ...[
                Center(
                  child: Container(
                    width: boxWidth,
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'File Processed Successfully!',
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text('Result: $_resultMessage', style: TextStyle(fontSize: 20)),
                        SizedBox(height: 10),

                        // Fraud Transactions with red background
                        Container(
                          padding: EdgeInsets.all(8),
                          color: Colors.red,
                          child: Text(
                            'Fraud Transactions: $_fraudTransactions',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 10),

                        // Non-Fraud Transactions with green background
                        Container(
                          padding: EdgeInsets.all(8),
                          color: Colors.green,
                          child: Text(
                            'Non-Fraud Transactions: $_nonFraudTransactions',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),

                        SizedBox(height: 10),

                        // Graphs Section
                        if (_fraudVsNonfraudGraph != null)
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Image.memory(_fraudVsNonfraudGraph!),
                          ),
                        if (_amountDistributionGraph != null)
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Image.memory(_amountDistributionGraph!),
                          ),
                        if (_fraudAmountGraph != null)
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Image.memory(_fraudAmountGraph!),
                          ),
                        if (_nonFraudAmountGraph != null)
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Image.memory(_nonFraudAmountGraph!),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
