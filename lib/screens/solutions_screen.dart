import 'package:flutter/material.dart';

class SolutionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Solutions'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            Text(
              'Credit Card Fraud Prevention Solutions',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 20),
            // Solutions Cards
            buildSolutionCard(
              context,
              title: 'Secure Your Card Details',
              description:
                  'Never share your PIN or card number online or in public.',
              icon: Icons.security,
              colors: [Colors.green, Colors.teal],
            ),
            buildSolutionCard(
              context,
              title: 'Monitor Transactions Regularly',
              description:
                  'Check your transactions frequently for any suspicious activity.',
              icon: Icons.history,
              colors: [Colors.orange, Colors.deepOrange],
            ),
            buildSolutionCard(
              context,
              title: 'Enable Transaction Alerts',
              description:
                  'Set up SMS or email alerts to get notified of every transaction.',
              icon: Icons.notification_important,
              colors: [Colors.redAccent, Colors.red],
            ),
            buildSolutionCard(
              context,
              title: 'Report Suspicious Transactions',
              description:
                  'Immediately report any suspicious transaction to your bank.',
              icon: Icons.report,
              colors: [Colors.purple, Colors.deepPurple],
            ),
          ],
        ),
      ),
    );
  }

  // Method to build solution card
  Widget buildSolutionCard(BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required List<Color> colors,
  }) {
    return GestureDetector(
      onTap: () {
        // Show more details about the solution when tapped
      },
      child: Card(
        elevation: 8,
        shadowColor: colors.last,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(icon, color: Colors.white, size: 50),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
