import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Credit Card Fraud Prevention'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Heading for Fraud Prevention
              Text(
                'Credit Card Fraud Prevention Methods',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 20),

              // Image for fraud prevention
              Center(
                child: Image.asset(
                  'assets/images/frd_prev.jpg',  // Add an image in the assets folder
                  height: 250,
                  width: 450,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),

              // Brief description of fraud prevention
              Text(
                'Credit card fraud is one of the most common types of financial fraud. '
                'It occurs when someone uses your credit card or credit card information '
                'without permission to make unauthorized transactions. Below are some key prevention methods:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),

              // List of fraud prevention methods in card style
              _buildMethodCard(
                context,
                'Use Strong Passwords for Online Transactions',
                'Always use complex passwords to secure online payments.',
                'assets/images/pass.jpg',  // Image for password security
              ),
              _buildMethodCard(
                context,
                'Regularly Monitor Your Statements',
                'Keep a close eye on your transaction history to spot any unusual activity.',
                'assets/images/rm.jpg',  // Image for monitoring
              ),
              _buildMethodCard(
                context,
                'Enable Two-Factor Authentication (2FA)',
                'Use 2FA to add an extra layer of security to your online accounts.',
                'assets/images/tfa.jpg',  // Image for 2FA
              ),
              _buildMethodCard(
                context,
                'Avoid Sharing Your Credit Card Information',
                'Be cautious about sharing your credit card details online or over the phone.',
                'assets/images/asc.jpg',  // Image for secure transactions
              ),
              _buildMethodCard(
                context,
                'Use Secure Websites for Transactions',
                'Look for HTTPS in website URLs to ensure security.',
                'assets/images/secure.jpg',  // Image for secure websites
              ),
              _buildMethodCard(
                context,
                'Report Suspicious Activity Immediately',
                'Contact your bank immediately if you notice any fraud-related activities.',
                'assets/images/suspi.jpg',  // Image for reporting
              ),
              SizedBox(height: 40),

              // Footer content
              Center(
                child: Text(
                  'By following these methods, you can help protect yourself from credit card fraud.',
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build fraud prevention method cards
  Widget _buildMethodCard(BuildContext context, String title, String description, String imagePath) {
    return Card(
      elevation: 8,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Icon for each prevention method
            Image.asset(
              imagePath,
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 15),
            // Title and description for each prevention method
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
