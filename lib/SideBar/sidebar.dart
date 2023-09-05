import 'package:bughub_demo/Theme/theme.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      color: Colors.white,
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
                    color: Color.fromARGB(84, 113, 25, 20),
                    blurRadius: 5.0,
                    spreadRadius: 1.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 6.0, horizontal: 12.0),
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    color: Color.fromARGB(255, 113, 24, 20),
                    size: 35,
                  ),
                  label: const Text(
                    'Create Issue',
                    style: TextStyle(
                      color: Color.fromARGB(255, 113, 24, 20),
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
          ),
          ListTile(
            leading: const Icon(Icons.person, color: Color.fromARGB(255, 113, 24, 20)),
            contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
            title: const Text(
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
          ),
          ListTile(
            leading: const Icon(Icons.person_add, color: Color.fromARGB(255, 113, 24, 20)),
            contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
            title: const Text(
              "CC'ed Issues",
              style: TextStyle(
                color: Color.fromARGB(255, 113, 24, 20),
                fontSize: 15.0,
              ),
            ),
            onTap: () {
              // Handle settings item click
            },
          ),
          const Divider(
            indent: 6.0,
            endIndent: 6.0,
          ),
          // Add more items as needed
          ListTile(
            leading: const Icon(Icons.report, color: Color.fromARGB(255, 113, 24, 20)),
            contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
            title: const Text(
              "Created Issues",
              style: TextStyle(
                color: Color.fromARGB(255, 113, 24, 20),
                fontSize: 15.0,
              ),
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
