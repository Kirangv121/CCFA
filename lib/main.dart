import 'package:flutter/material.dart';
import 'screens/login_screen.dart';  // Correct import

void main() {
  runApp(MynewApp());
}

 class MynewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Credit Card Fraud Detection',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(),  // The login screen is the initial screen
    );
  }
}
