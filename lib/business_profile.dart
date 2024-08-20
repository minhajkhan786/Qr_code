import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class BusinessProfile extends StatefulWidget {
  @override
  _BusinessProfileState createState() => _BusinessProfileState();
}

class _BusinessProfileState extends State<BusinessProfile> {
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController businessTypeController = TextEditingController();
  final TextEditingController timingController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController faxNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  String qrData = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Business Profile"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                controller: businessNameController,
                decoration: InputDecoration(
                  labelText: 'Business Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: businessTypeController,
                decoration: InputDecoration(
                  labelText: 'Business Type',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: timingController,
                decoration: InputDecoration(
                  labelText: 'Timing',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: mobileNumberController,
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: phoneNumberController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: faxNumberController,
                decoration: InputDecoration(
                  labelText: 'Fax Number',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email ID',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: websiteController,
                decoration: InputDecoration(
                  labelText: 'Website',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    qrData = """
Business Name: ${businessNameController.text}
Business Type: ${businessTypeController.text}
Timing: ${timingController.text}
Mobile Number: ${mobileNumberController.text}
Phone Number: ${phoneNumberController.text}
Fax Number: ${faxNumberController.text}
Email ID: ${emailController.text}
Website: ${websiteController.text}
Address: ${addressController.text}
""";
                  });
                },
                child: Text('Generate'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), // Make button full width
                ),
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
}
