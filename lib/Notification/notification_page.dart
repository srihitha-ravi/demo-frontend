import 'package:bughub_demo/Theme/appbar_theme.dart';
import 'package:bughub_demo/Theme/notification_theme.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<String> notifications = [
    'Notification 1',
    'Notification 2',
    'Notification 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: appThemeData,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Notifications',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return Card(
              elevation: 4.0, // Add elevation to the card for a shadow
              shadowColor: Color.fromARGB(255, 113, 24, 20),
              margin: EdgeInsets.all(8.0), // Add margin for spacing
              child: ListTile(
                title: Text(notification,
                style: myNotificationStyle,
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  color: Color.fromARGB(255, 113, 24, 20),
                  onPressed: () {
                    // Remove the notification when delete button is pressed
                    setState(() {
                      notifications.removeAt(index);
                    });
    
                    // Show a SnackBar with undo option
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Notification deleted'),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            // Undo the deletion
                            setState(() {
                              notifications.insert(index, notification);
                            });
                          },
                        ),
                      ),
                    );
    
                    // Automatically remove the undo option after 5 seconds
                    Future.delayed(Duration(seconds: 5), () {
                      if (ScaffoldMessenger.of(context).mounted) {
                        ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      }
                    });
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
