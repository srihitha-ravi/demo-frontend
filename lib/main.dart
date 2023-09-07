import 'package:flutter/material.dart';

void main() => runApp(BugReportPage());

class BugReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Color(0xFF711814),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          title: Row(
            children: [
              Image.asset(
                'assets/BugHub.png',
                width: 80,
                height: 80,
              ),
              SizedBox(width: 10),
              Container(
                width: 150,
                decoration: BoxDecoration(
                  color: Color.fromARGB(66, 255, 154, 150),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Color(0xFF711814)),
                    suffixIcon: Icon(
                      Icons.search,
                      color: Color(0xFF711814),
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
  String? selectedIssueType = 'Bug';
  String? selectedProduct = 'Product A';
  String? selectedComponent = 'Component X';
  String? selectedPriority = 'High';
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController assignToController = TextEditingController();

  final List<String> issueTypes = ['Bug', 'Feature Request', 'Other'];
  final List<String> products = ['Product A', 'Product B', 'Product C'];
  final List<String> components = ['Component X', 'Component Y', 'Component Z'];
  final List<String> priorities = ['High', 'Medium', 'Low'];

  bool validateForm() {
    return [
      selectedIssueType,
      selectedProduct,
      selectedComponent,
      selectedPriority,
      titleController.text,
      descriptionController.text,
      assignToController.text,
    ].every((field) => field != null && field.isNotEmpty);
  }

  void showErrorSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Please fill in all the required fields.'),
        duration: Duration(seconds: 3),
      ),
    );
  }

  Widget buildDropdown(String labelText, String? selectedValue, List<String> items, void Function(String?)? onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          labelText,
          style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF711814)),
        ),
        Container(
          width: 200,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Color.fromARGB(66, 255, 154, 150),
            borderRadius: BorderRadius.circular(20),
          ),
          child: DropdownButton<String>(
            value: selectedValue,
            onChanged: onChanged,
            items: items.map((item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(color: Color(0xFF711814)),
                ),
              );
            }).toList(),
            underline: Container(),
          ),
        ),
      ],
    );
  }

  Widget buildTextField(String labelText, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF711814)),
        ),
        SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Color.fromARGB(66, 255, 154, 150),
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter $labelText',
              hintStyle: TextStyle(color: Color(0xFF711814)),
            ),
            maxLines: labelText == 'Description' ? 4 : 1,
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: ListView(
        children: [
          SizedBox(height: 20),
          buildDropdown('Issue Type', selectedIssueType, issueTypes, (newValue) {
            setState(() => selectedIssueType = newValue);
          }),
          SizedBox(height: 20), // Added space here
          buildDropdown('Product', selectedProduct, products, (newValue) {
            setState(() => selectedProduct = newValue);
          }),
          SizedBox(height: 20), // Added space here
          buildDropdown('Component', selectedComponent, components, (newValue) {
            setState(() => selectedComponent = newValue);
          }),
          SizedBox(height: 20), // Added space here
          buildDropdown('Priority', selectedPriority, priorities, (newValue) {
            setState(() => selectedPriority = newValue);
          }),
          SizedBox(height: 20), // Added space here
          buildTextField('Title', titleController),
          buildTextField('Description', descriptionController),
          buildTextField('Assign To', assignToController),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    validateForm() ? print('Form submitted!') : showErrorSnackbar(context);
                  },
                  child: Text('Submit', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF711814),
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
