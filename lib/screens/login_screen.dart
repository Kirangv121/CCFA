import 'package:flutter/material.dart';
import 'dashboard_screen.dart'; // Import DashboardScreen
import 'package:email_validator/email_validator.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _passwordStrength = '';

  // Declare _isHovered to track hover state
  bool _isHovered = false;

  // Method to check the password strength
  void _checkPasswordStrength(String password) {
    if (password.length < 4) {
      setState(() {
        _passwordStrength = 'Weak';
      });
    } else if (password.length >= 4 && password.length < 7) {
      setState(() {
        _passwordStrength = 'Moderate';
      });
    } else {
      setState(() {
        _passwordStrength = 'Strong';
      });
    }
  }

  void login() {
    String name = _nameController.text;  // Get the name from the controller
    String email = _emailController.text;
    String password = _passwordController.text;

    if (EmailValidator.validate(email) && password.isNotEmpty) {
      if (_passwordStrength == 'Strong') {
        // Proceed to DashboardScreen if password is strong
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DashboardScreen(name: name, email: email),
          ),
        );
        
        // Store the data in Google Sheets (not implemented yet)
        storeInGoogleSheet(name, email, password);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password is weak.')));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please enter valid credentials')));
    }
  }

  // Method to store login data in Google Sheets (stub for now)
  void storeInGoogleSheet(String name, String email, String password) {
    // You would need to implement the Google Sheets API integration here.
    // For example, using the googleapis package.
    print("Login data: $name, $email, $password");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Login', style: TextStyle(color: Colors.white)),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo in a round circle with hover effect
              MouseRegion(
                onEnter: (_) => setState(() => _isHovered = true), // Trigger hover effect
                onExit: (_) => setState(() => _isHovered = false),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: _isHovered ? 150 : 125, // Slightly enlarge on hover
                  width: _isHovered ? 150 : 125, // Slightly enlarge on hover
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    boxShadow: [
                      BoxShadow(
                        color: _isHovered
                            ? Colors.black.withOpacity(0.4) // Stronger shadow on hover
                            : Colors.black.withOpacity(0.2),
                        blurRadius: 15,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/logo1.jpg', // Replace with your logo asset path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.blueAccent),
                  prefixIcon: Icon(Icons.person, color: Colors.blueAccent),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.blueAccent),
                  prefixIcon: Icon(Icons.email, color: Colors.blueAccent),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 15),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.blueAccent),
                  prefixIcon: Icon(Icons.lock, color: Colors.blueAccent),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
                obscureText: true,
                onChanged: _checkPasswordStrength,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _passwordStrength,
                    style: TextStyle(
                      color: _passwordStrength == 'Weak' ? Colors.red : (_passwordStrength == 'Moderate' ? Colors.orange : Colors.green),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: MouseRegion(
                  onEnter: (_) => setState(() {}),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueAccent.withOpacity(0.5),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: login,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text('Login', style: TextStyle(fontSize: 18)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ", style: TextStyle(fontSize: 16)),
                  GestureDetector(
                    onTap: () {
                      // Navigate to sign-up screen
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 16, color: Colors.blueAccent, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
