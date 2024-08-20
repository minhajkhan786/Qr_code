import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

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

  String qrData = "";  // This will store the QR code data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: jobTitleController,
                decoration: InputDecoration(labelText: 'Job Title'),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: mobileNumberController,
                decoration: InputDecoration(labelText: 'Mobile Number'),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email ID'),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    qrData = """
Name: ${nameController.text}
Job Title: ${jobTitleController.text}
Mobile Number: ${mobileNumberController.text}
Email: ${emailController.text}
Address: ${addressController.text}
""";
                  });
                },
                child: Text('Generate QR Code'),
              ),
              SizedBox(height: 20),
              qrData.isNotEmpty
                  ? QrImageView(
                data: qrData,
                version: QrVersions.auto,
                size: 200.0,
              )
                  : Container(),
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
