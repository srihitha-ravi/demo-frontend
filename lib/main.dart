import 'package:flutter/material.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white, // Set the background color to white
        body: LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white, // Box color in #711814
            ),
            child: Center(
              child: Image.asset(
                'assets/bughub.png', // Replace with your logo image path
                width: 600,
                height: 600,
              ),
            ),
          ),
          SizedBox(height: 10), // Reduce the SizedBox height to 10
          Text(
            'BugHub',
            style: TextStyle(
              fontSize: 24,
              color: Color(0xFF711814), // Text color set to white
              fontWeight: FontWeight.bold, // Make the text bold
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              // Add your Google Sign-In logic here
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF711814), // Background color in #711814
              onPrimary: Colors.white, // Text color set to white
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // Round the edges
              ),
            ),
            icon: Icon(
              Icons.mail, // Replace with the Google icon you prefer
            ),
            label: Text('Sign in with Google'),
          ),
        ],
      ),
    );
  }
}
