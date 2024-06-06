import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                controller: jobTitleController,
                decoration: InputDecoration(labelText: 'Job Title'),
              ),
              TextFormField(
                controller: mobileNumberController,
                decoration: InputDecoration(labelText: 'Mobile Number'),
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email ID'),
              ),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle form submission here
                  String name = nameController.text;
                  String jobTitle = jobTitleController.text;
                  String mobileNumber = mobileNumberController.text;
                  String email = emailController.text;
                  String address = addressController.text;
                  // Do something with the collected data, such as saving to database or displaying
                  // a confirmation message.
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up controllers when the widget is disposed
    nameController.dispose();
    jobTitleController.dispose();
    mobileNumberController.dispose();
    emailController.dispose();
    addressController.dispose();
    super.dispose();
  }
}
