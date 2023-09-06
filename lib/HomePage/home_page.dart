import 'package:flutter/material.dart';
import 'package:bughub_demo/SideBar/sidebar.dart';
import 'package:bughub_demo/Notification/notification_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSidebarOpen = false;
  String notificationMessage = '';

  void _handleNotifications() {
  setState(() {
    isSidebarOpen = false;
  });
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => NotificationsPage(),
    ),
  );
}

  void toggleSidebar() {
    setState(() {
      isSidebarOpen = !isSidebarOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Color.fromARGB(255, 113, 24, 20),
        backgroundColor: Colors.white,
        leading: IconButton(
          padding: EdgeInsets.only(left: 10.0),
          icon: const Icon(
            Icons.menu,
            color: Color.fromARGB(255, 113, 24, 20),
          ),
          onPressed: toggleSidebar,
        ),
        title: Row(
          children: [
            Image.asset(
              'assets/logo/BugHub.png',
              height: 30,
              width: 30,
            ),
            const Text(
              'BugHub',
              style: TextStyle(
                color: Color.fromARGB(255, 113, 24, 20),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 5.0),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(66, 255, 154, 150),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 113, 24, 20),
                      size: 20,
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: TextField(
                        cursorColor: const Color.fromARGB(255, 113, 24, 20),
                        decoration: const InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            fontSize: 13.0,
                            
                            fontStyle: FontStyle.italic,
                            color: Color.fromARGB(255, 113, 24, 20),
                          ),
                          border: InputBorder.none,
                        ),
                        onSubmitted: (value) {
                          // Implement search functionality here
                          // You can use the 'value' variable to perform the search.
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Color.fromARGB(255, 113, 24, 20),
              ),
              onPressed: _handleNotifications,
            ),
            IconButton(
              icon: const Icon(
                Icons.account_circle,
                color: Color.fromARGB(255, 113, 24, 20),
              ),
              onPressed: () {
                // Implement notification button functionality here
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          const Expanded(
            child: Center(
              child: Text('Main Content'),
            ),
          ),
          if (isSidebarOpen)
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              width: 200, // Adjust the width of the sidebar as needed
              child: Sidebar(),
            ),
          if (notificationMessage.isNotEmpty)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color:
                    Colors.white.withOpacity(0.7), // Semi-transparent overlay
                child: Center(
                  child: Card(
                    // Customize the appearance of the notification here
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(notificationMessage),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
