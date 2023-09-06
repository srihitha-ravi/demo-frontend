import 'package:bughub_demo/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bughub_demo/Create Issue/create_issue.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      color: Color.fromARGB(255, 113, 24, 20),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 5.0,
                    spreadRadius: 1.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CreateIssuePage(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Color.fromARGB(255, 113, 24, 20),
                    size: 35,
                  ),
                  label: Text(
                    'Create Issue',
                    style: GoogleFonts.raleway(
                      textStyle: const TextStyle(
                          color: Color.fromARGB(255, 113, 24, 20),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Divider(
            indent: 6.0,
            endIndent: 6.0,
            color: Colors.white,
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.white),
            contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
            title: Text(
              'Home',
              style: myTextStyle,
            ),
            onTap: () {
              // Handle home item click
            },
          ),

          const Divider(
            indent: 6.0,
            endIndent: 6.0,
            color: Colors.white,
          ),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.white),
            contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
            title: Text(
              'Assigned Issues',
              style: myTextStyle,
            ),
            onTap: () {
              // Handle home item click
            },
          ),
          const Divider(
            indent: 6.0,
            endIndent: 6.0,
            color: Colors.white,
          ),
          ListTile(
            leading: const Icon(Icons.person_add, color: Colors.white),
            contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
            title: Text(
              "CC'ed Issues",
              style: myTextStyle,
            ),
            onTap: () {
              // Handle settings item click
            },
          ),
          const Divider(
            indent: 6.0,
            endIndent: 6.0,
            color: Colors.white,
          ),
          // Add more items as needed
          ListTile(
            leading: const Icon(Icons.report, color: Colors.white),
            contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
            title: Text(
              "Created Issues",
              style: myTextStyle,
            ),
            onTap: () {
              // Handle settings item click
            },
          ),
        ],
      ),
    );
  }
}
