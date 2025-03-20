import 'package:flutter/material.dart';
import 'login_screen.dart'; // Import the login screen

class ProfileScreen extends StatelessWidget {
  final String name;
  final String email;

  ProfileScreen({required this.name, required this.email}); // Accepting name and email

  void _logout(BuildContext context) {
    // Navigate to the login screen and reset the state
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (Route<dynamic> route) => false, // Remove all previous routes
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.green,
         
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile picture with gradient border
              Center(
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Colors.blueAccent, Colors.lightBlueAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.black,
                    child: Text(
                      name[0].toUpperCase(), // Initial letter of the name
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),

              // Name display in the center
              Text(
                'Name',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 5),
              Text(
                name,
                style: TextStyle(
                  fontSize: 16,
              
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),

              // Email display in the center
              Text(
                'Email',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                  
                ),
              ),
              SizedBox(height: 9),
              Text(
                email,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40),

              // Logout button
              ElevatedButton(
                onPressed: () => _logout(context), // Call the logout function
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.logout, size: 20),
                    SizedBox(width: 5),
                    Text('Logout', style: TextStyle(fontSize: 16,color:Colors.white)),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),

              SizedBox(height: 30),

              // Footer
              Center(
                child: Text(
                  'Thank you for using our app!',
                  style: TextStyle(

                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
