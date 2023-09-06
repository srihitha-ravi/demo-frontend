import 'package:bughub_demo/Theme/appbar_theme.dart';
import 'package:flutter/material.dart';
import 'package:bughub_demo/SideBar/sidebar.dart';
import 'package:bughub_demo/Notification/notification_page.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Theme(
      data: appThemeData,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Color.fromARGB(255, 113, 24, 20),
            ),
            onPressed: toggleSidebar,
          ),
          titleSpacing: 0,
          title: Row(
            children: [
              Image.asset(
                'assets/logo/BugHub.png',
                height: 35,
                width: 35,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 2.0),
              Text(
                'BugHub',
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    color: Color.fromARGB(255, 113, 24, 20),
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
              const SizedBox(width: 12.0),
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
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            hintStyle: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                              fontSize: 13.0,
                              fontStyle: FontStyle.italic,
                              color: Color.fromARGB(112, 113, 25, 20),
                            ),
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
                padding: const EdgeInsets.all(
                  12.0,
                ),
                constraints: const BoxConstraints(),
                icon: const Icon(
                  Icons.notifications,
                  color: Color.fromARGB(255, 113, 24, 20),
                ),
                onPressed: _handleNotifications,
              ),
              IconButton(
                padding: const EdgeInsets.only(
                  right: 12.0,
                ),
                constraints: const BoxConstraints(),
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
      ),
    );
  }
}
