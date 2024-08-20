import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  TextEditingController mobileNumberController = TextEditingController();

  String qrData = "";  // This will store the QR code data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: mobileNumberController,
                decoration: InputDecoration(labelText: 'Mobile Number'),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (mobileNumberController.text.isNotEmpty) {
                    setState(() {
                      qrData = mobileNumberController.text;
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please enter a mobile number')),
                    );
                  }
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
    mobileNumberController.dispose();
    super.dispose();
  }
}
