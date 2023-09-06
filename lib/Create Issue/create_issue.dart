import 'package:flutter/material.dart';

class CreateIssuePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Issue'),
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
    );
  }
}
