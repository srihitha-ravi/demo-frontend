import 'package:bughub_demo/Theme/appbar_theme.dart';
import 'package:flutter/material.dart';

class CreateIssuePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: appThemeData,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Create Issue',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Add your content for creating an issue here
              Text(
                'Create Issue Page',
                style: TextStyle(fontSize: 24),
              ),
              // Add form fields, buttons, or any other UI elements needed for issue creation
            ],
          ),
        ),
      ),
    );
  }
}
