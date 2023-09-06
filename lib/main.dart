import 'package:flutter/material.dart';

void main() => runApp(BugReportPage());

class BugReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBar(
            backgroundColor: Colors.white,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(
                    Icons.menu, // Add the sandwich menu icon here
                    color: Color(0xFF711814),
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
            title: Row(
              children: [
                Image.asset(
                  'assets/BugHub.png',
                  width: 80, // Increase the image size
                  height: 80, // Increase the image size
                ),
                SizedBox(width: 10),
                Container(
                  width: 150, // Reduced search bar width
                  decoration: BoxDecoration(
                    color: Color.fromARGB(66, 255, 154, 150), // Updated color scheme for the search bar
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Color(0xFF711814),
                      ),
                      suffixIcon: Icon(
                        Icons.search,
                        color: Color(0xFF711814), // Icon color for the search bar
                      ),
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Color(0xFF711814),
                ),
                onPressed: () {
                  // Handle notifications action here
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.account_circle,
                  color: Color(0xFF711814),
                ),
                onPressed: () {
                  // Handle account action here
                },
              ),
            ],
          ),
        ),
        body: BugReportForm(),
      ),
    );
  }
}

class BugReportForm extends StatefulWidget {
  @override
  _BugReportFormState createState() => _BugReportFormState();
}

class _BugReportFormState extends State<BugReportForm> {
  String selectedIssueType = 'Bug';
  String selectedProduct = 'Product A';
  String selectedComponent = 'Component X';
  String selectedPriority = 'High';
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController assignToController = TextEditingController(); // Added Assign To

  final List<String> issueTypes = ['Bug', 'Feature Request', 'Other'];
  final List<String> products = ['Product A', 'Product B', 'Product C'];
  final List<String> components = ['Component X', 'Component Y', 'Component Z'];
  final List<String> priorities = ['High', 'Medium', 'Low'];

  // Function to validate the form
  bool validateForm() {
    if (selectedIssueType.isEmpty ||
        selectedProduct.isEmpty ||
        selectedComponent.isEmpty ||
        selectedPriority.isEmpty ||
        titleController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        assignToController.text.isEmpty) {
      return false; // Form is not valid
    }
    return true; // Form is valid
  }


  void showErrorSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Please fill in all the required fields.'),
        duration: Duration(seconds: 3),
      ),
    );
  }

  double dropdownWidth = 80;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: ListView(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Issue Type',
                style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF711814)),
              ),
              Container(
                width: 200,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(66, 255, 154, 150), // Adjust opacity here
                  borderRadius: BorderRadius.circular(20),
                ),
                child: DropdownButton<String>(
                  value: selectedIssueType,
                  onChanged: (newValue) {
                    setState(() {
                      selectedIssueType = newValue!;
                    });
                  },
                  items: issueTypes.map((type) {
                    return DropdownMenuItem<String>(
                      value: type,
                      child: Text(
                        type,
                        style: TextStyle(color: Color(0xFF711814)),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Product',
                style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF711814)),
              ),
              Container(
                width: 200,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(66, 255, 154, 150), // Adjust opacity here
                  borderRadius: BorderRadius.circular(20),
                ),
                child: DropdownButton<String>(
                  value: selectedProduct,
                  onChanged: (newValue) {
                    setState(() {
                      selectedProduct = newValue!;
                    });
                  },
                  items: products.map((product) {
                    return DropdownMenuItem<String>(
                      value: product,
                      child: Text(
                        product,
                        style: TextStyle(color: Color(0xFF711814)),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Component',
                style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF711814)),
              ),
              Container(
                width: 200,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(66, 255, 154, 150), // Adjust opacity here
                  borderRadius: BorderRadius.circular(20),
                ),
                child: DropdownButton<String>(
                  value: selectedComponent,
                  onChanged: (newValue) {
                    setState(() {
                      selectedComponent = newValue!;
                    });
                  },
                  items: components.map((component) {
                    return DropdownMenuItem<String>(
                      value: component,
                      child: Text(
                        component,
                        style: TextStyle(color: Color(0xFF711814)),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Priority',
                style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF711814)),
              ),
              Container(
                width: 200,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(66, 255, 154, 150), // Adjust opacity here
                  borderRadius: BorderRadius.circular(20),
                ),
                child: DropdownButton<String>(
                  value: selectedPriority,
                  onChanged: (newValue) {
                    setState(() {
                      selectedPriority = newValue!;
                    });
                  },
                  items: priorities.map((priority) {
                    return DropdownMenuItem<String>(
                      value: priority,
                      child: Text(
                        priority,
                        style: TextStyle(color: Color(0xFF711814)),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Title',
            style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF711814)),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Color.fromARGB(66, 255, 154, 150), // Adjust opacity here
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              controller: titleController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter title',
                hintStyle: TextStyle(color: Color(0xFF711814)),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Description',
            style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF711814)),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Color.fromARGB(66, 255, 154, 150), // Adjust opacity here
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter description',
                hintStyle: TextStyle(color: Color(0xFF711814)),
              ),
              maxLines: 4,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Assign To',
            style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF711814)),
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Color.fromARGB(66, 255, 154, 150), // Adjust opacity here
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              controller: assignToController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Assign to',
                hintStyle: TextStyle(color: Color(0xFF711814)),
              ),
            ),
          ),
          SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (validateForm()) {
                      // Handle form submission here
                    } else {
                      showErrorSnackbar(context);
                    }
                  },
                  child: Text('Submit', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF711814), // Adjust opacity here
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    // Handle attachment action here
                  },
                  icon: Icon(
                    Icons.attach_file,
                    color: Color(0xFF711814),
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
