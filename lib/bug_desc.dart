import 'package:flutter/material.dart';
import 'package:bughub_demo/SideBar/sidebar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSidebarOpen = false;

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
          icon: Icon(
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
            Text(
              'BugHub',
              style: TextStyle(
                color: Color.fromARGB(255, 113, 24, 20),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 5.0),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(66, 255, 154, 150),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 113, 24, 20),
                      size: 20,
                    ),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: TextField(
                        cursorColor: Color.fromARGB(255, 113, 24, 20),
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            fontSize: 13.0,
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
              icon: Icon(
                Icons.notifications,
                color: Color.fromARGB(255, 113, 24, 20),
              ),
              onPressed: () {
                // Implement notification button functionality here
              },
            ),
            IconButton(
              icon: Icon(
                Icons.account_circle,
                color: Color.fromARGB(255, 113, 24, 20),
              ),
              onPressed: () {
                // Implement account button functionality here
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // Translate the body to the right when the sidebar is open
          Transform.translate(
            offset: Offset(isSidebarOpen ? 200.0 : 0.0, 0.0), // Adjust the value as needed
            child: ListView(
              children: [
                // Add the title here
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 24.0, left: 18.0, right: 5.0), // Adjust the left padding for spacing
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Color.fromARGB(255, 113, 24, 20),
                          BlendMode.srcATop,
                        ),
                        child: Image.asset(
                          'assets/back.png', // Replace with your image path
                          height: 18, // Adjust the height as needed
                          width: 18, // Adjust the width as needed
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 24.0, left: 3.0, right: 5.0),  // Adjust the left padding for spacing
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Color.fromARGB(255, 113, 24, 20),
                          BlendMode.srcATop,
                        ),
                        child: Image.asset(
                          'assets/refresh.png', // Replace with your image path
                          height: 18, // Adjust the height as needed
                          width: 18, // Adjust the width as needed
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 24.0, left: 3.0, right: 10.0),  // Adjust the left padding for spacing
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Color.fromARGB(255, 113, 24, 20),
                          BlendMode.srcATop,
                        ),
                        child: Image.asset(
                          'assets/star.png', // Replace with your image path
                          height: 18, // Adjust the height as needed
                          width: 18, // Adjust the width as needed
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 24.0, left: 5.0, right: 5.0),
                      child: Text(
                        'Title of the Issue',
                        style: TextStyle(
                          color: Color.fromARGB(255, 113, 24, 20),
                          fontSize: 20.0, // Adjust the font size as needed
                          fontWeight: FontWeight.bold, // Make the font bold
                        ),
                      ),
                    ),

                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 20.0, left: 16.0, bottom: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SectionInfo(
                        label: 'Reporter',
                        value: 'j.zapanta@pvp.co.jp',
                      ),
                      SectionInfo(
                        label: 'Issue Type',
                        value: 'Feature Request',
                      ),
                      SectionInfo(
                        label: 'Product',
                        value: 'BugHub App',
                      ),
                      SectionInfo(
                        label: 'Component',
                        value: 'UI Issues',
                      ),
                      SectionInfo(
                        label: 'Priority',
                        value: 'P2',
                      ),
                      SectionInfo(
                        label: 'Date Time Created',
                        value: 'April 20, 2023 12:20 PM',
                      ),
                      SectionInfo(
                        label: 'Assignee',
                        value: 's.yalamanchili@pvp.co.jp',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(
                    color: Color.fromARGB(255, 113, 24, 20),
                    thickness: 1.0,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 16.0, bottom: 25.0),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 3.0), // Add padding to create space
                            child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                Color.fromARGB(255, 113, 24, 20),
                                BlendMode.srcATop,
                              ),
                              child: Image.asset(
                                'assets/docs.png',
                                height: 16,
                                width: 16,
                              ),
                            ),
                          ),
                          Text(
                            'Description',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 113, 24, 20),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse tempus nulla quis diam tristique gravida. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Quisque ipsum neque, bibendum et nunc a, viverra suscipit nibh. Phasellus ac elit leo. Duis sapien arcu, tincidunt ut ipsum laoreet, rhoncus aliquet est. Aliquam ac orci pharetra, convallis mi porttitor, congue ante. Pellentesque ac placerat diam. Curabitur enim elit, condimentum sit amet purus nec, bibendum fermentum eros.',
                        style: TextStyle(
                          color: const Color(0xFF36454F),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: Color.fromARGB(255, 113, 24, 20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 3.0), // Add padding to create space
                                child: ColorFiltered(
                                  colorFilter: ColorFilter.mode(
                                    Color.fromARGB(255, 113, 24, 20),
                                    BlendMode.srcATop,
                                  ),
                                  child: Image.asset(
                                    'assets/comment.png',
                                    height: 16,
                                    width: 16,
                                  ),
                                ),
                              ),
                              Text(
                                'Comments',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 113, 24, 20),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Column(
                            children: [
                              CommentItem(
                                username: 'Jen Zapanta <j.zapanta@pvp.co.jp>',
                                datetime: 'Aug 22, 2023 5:45 AM',
                                comment: 'This app is amazing!',
                              ),
                              CommentItem(
                                username: 'Mauricio Avila <m.becerra@pvp.co.jp>',
                                datetime: 'Aug 23, 2023 10:30 PM',
                                comment: 'hahaha!',
                              ),
                            ],
                          ),
                          SizedBox(height: 16.0),
                          TextField(
                            maxLines: 6,
                            controller: TextEditingController()..text = 'Add a comment...',
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.all(8.0),
                              fillColor: Color.fromARGB(66, 255, 154, 150),
                              filled: true,
                            ),
                            style: TextStyle(
                              color: const Color(0xFF36454F),
                              fontSize: 13.0,
                            ),
                            onTap: () {
                              TextEditingController().clear();
                            },
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  // Implement functionality for the first button here
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 113, 24, 20),
                                    borderRadius: BorderRadius.circular(30.0), // Adjust the radius as needed
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 6.0, horizontal: 12.0
                                  ),
                                  child: Text(
                                    'Comment',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
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
        ],
      ),
    );
  }
}

class SectionInfo extends StatelessWidget {
  final String label;
  final String value;

  SectionInfo({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          '$label:',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: const Color(0xFF36454F),
          ),
        ),
        SizedBox(width: 8.0),
        Text(
          value,
          style: TextStyle(
            color: const Color(0xFF36454F),
          ),
        ),
      ],
    );
  }
}

class CommentItem extends StatelessWidget {
  final String username;
  final String datetime;
  final String comment;

  CommentItem({
    required this.username,
    required this.datetime,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          username,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: const Color(0xFF36454F),
          ),
        ), // Add a space here
        Text(
          datetime,
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 10.0,
            color: const Color(0xFF36454F),
          ),
        ),
        SizedBox(height: 10), // Add a space here
        Text(
          comment,
          style: TextStyle(
            color: const Color(0xFF36454F),
          ),
        ),
        Divider(
          color: Color.fromARGB(255, 113, 24, 20),
          thickness: 0.5,
        ),
      ],
    );
  }
}
