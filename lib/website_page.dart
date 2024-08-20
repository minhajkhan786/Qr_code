import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class WebsitePage extends StatefulWidget {
  @override
  _WebsitePageState createState() => _WebsitePageState();
}

class _WebsitePageState extends State<WebsitePage> {
  TextEditingController websiteController = TextEditingController();

  String qrData = "";  // This will store the QR code data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Website Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: websiteController,
                decoration: InputDecoration(labelText: 'Website'),
                keyboardType: TextInputType.url,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    qrData = websiteController.text;
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
    websiteController.dispose();
    super.dispose();
  }
}
