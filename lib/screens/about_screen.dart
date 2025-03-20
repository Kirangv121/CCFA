import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('About Us'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // About Title
              Text(
                'About the App',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 20),

              // App Description
              Text(
                'The Credit Card Fraud Detection app is designed to help individuals monitor and secure their financial transactions. By analyzing transaction patterns and alerting users to suspicious activity, this app works to prevent fraudulent charges on credit cards.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 20),

              // Features Section
              Text(
                'Features:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '- Real-time fraud alerts for suspicious transactions.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- Upload and analyze your credit card transaction data.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- Protection against unauthorized access to your financial information.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              // Mission Section
              Text(
                'Our Mission:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Our mission is to empower individuals with the tools needed to secure their financial data and prevent fraudulent activities. We aim to provide users with an intuitive platform for detecting fraud before it causes harm.',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 20),

              // Contact Section
              Text(
                'Contact Us:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'If you have any questions or need support, feel free to reach out:',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 10),
              Text(
                'Email: support@fraudapp.com',
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
              Text(
                'Phone: +123 456 7890',
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
