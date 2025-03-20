import 'package:flutter/material.dart';
import 'profile_screen.dart';  // Import ProfileScreen
import 'home_screen.dart';  // Import HomeScreen
import 'upload_screen.dart';  // Import UploadScreen
import 'solutions_screen.dart';  // Import SolutionsScreen
import 'fraud_alert_screen.dart';  // Import FraudAlertScreen
import 'about_screen.dart';  // Import AboutScreen
import 'results_screen.dart';
class DashboardScreen extends StatefulWidget {
  final String name;
  final String email;

  DashboardScreen({required this.name, required this.email});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  // Navigation bar actions 
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigation based on selected index
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SolutionsScreen()), // Navigate to SolutionsScreen
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AboutScreen()), // Navigate to AboutScreen
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileScreen(
            name: widget.name, // Passing the name
            email: widget.email, // Passing the email
          ),
        ),
      );
    }
  }

  // Help & Support Popup
  void _showHelpPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Help & Support"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("For any issues, please contact us at:"),
              SizedBox(height: 10),
              Text("Email: support@fraudapp.com"),
              Text("Phone: +123 456 7890"),
              Text("Address: 123 Fraud Detection St."),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('CREDIT CARD FRAUD DETECTION',
               style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
        ),
        
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Heading
              Text(
                'Detect & Prevent Credit Card Frauds',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Empowering you with tools to ensure secure transactions.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 20),

              // Additional Effective Content
              Text(
                'Why Fraud Detection is Important:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Fraudulent activities on credit cards are increasingly common. It is vital to stay proactive and monitor your transactions regularly. This app helps you identify suspicious activities and protect your financial information.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 20),

              // Feature Cards
              buildFeatureCard(
                context,
                title: 'Prevention of Credit Card Frauds',
                description: 'Learn how to protect your card from frauds.',
                icon: Icons.shield,
                colors: [Colors.green, Colors.teal],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()), // Navigate to SolutionsScreen
                  );
                },
              ),
              buildFeatureCard(
                context,
                title: 'Upload CSV for Detection',
                description: 'Upload transaction data for detecting frauds.',
                icon: Icons.upload_file,
                colors: [Colors.orange, Colors.deepOrange],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UploadScreen()),
                  );
                },
              ),
              buildFeatureCard(
                context,
                title: 'Fraud Alert System',
                description: 'Get instant alerts on suspicious activity.',
                icon: Icons.notification_important,
                colors: [Colors.redAccent, Colors.red],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FraudAlertScreen()), // Navigate to FraudAlertScreen
                  );
                },
              ),

              buildFeatureCard(
                context,
                title: 'Help & Support',
                description: 'Get assistance for your concerns.',
                icon: Icons.help,
                colors: [Colors.lightBlue, Colors.blueGrey],
                onTap: _showHelpPopup, // Show the help popup
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: 'Solutions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: (index) {
          _onItemTapped(index); // Handle the onTap
        },
      ),
    );
  }

  // Method to build feature card
  Widget buildFeatureCard(BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required List<Color> colors,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
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
