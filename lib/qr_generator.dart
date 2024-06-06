import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrGeneratorPage extends StatefulWidget {
  final String qrData;

  QrGeneratorPage({required this.qrData});

  @override
  _QrGeneratorPageState createState() => _QrGeneratorPageState();
}

class _QrGeneratorPageState extends State<QrGeneratorPage> {
  TextEditingController qrTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    qrTextController.text = widget.qrData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generate QR Code'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            QrImageView(
              data: qrTextController.text,
              size: 200,
            ),
            SizedBox(height: 20),
            TextField(
              controller: qrTextController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter data to generate QR code',
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              child: Text('Generate'),
            ),
          ],
        ),
      ),
    );
  }
}
