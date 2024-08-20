import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TextPage extends StatefulWidget {
  @override
  _TextPageState createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  TextEditingController textController = TextEditingController();

  String qrData = "";  // This will store the QR code data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text to QR Code'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: textController,
                decoration: InputDecoration(labelText: 'Enter Text'),
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    qrData = textController.text;
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
    textController.dispose();
    super.dispose();
  }
}
