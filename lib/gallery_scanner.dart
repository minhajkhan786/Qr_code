import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_tools/qr_code_tools.dart';

class GalleryScannerPage extends StatefulWidget {
  @override
  _GalleryScannerPageState createState() => _GalleryScannerPageState();
}

class _GalleryScannerPageState extends State<GalleryScannerPage> {
  String? _qrData = 'No QR code data';

  Future<void> _pickImageAndScanQR() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      try {
        String? qrCode = await QrCodeToolsPlugin.decodeFrom(pickedFile.path);
        setState(() {
          _qrData = qrCode ?? 'No QR code found';
        });
      } catch (e) {
        setState(() {
          _qrData = 'Failed to decode QR code: $e';
        });
      }
    } else {
      setState(() {
        _qrData = 'No image selected';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan QR from Gallery'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_qrData != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'QR Code Data: $_qrData',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ElevatedButton(
              onPressed: _pickImageAndScanQR,
              child: Text('Pick Image from Gallery'),
            ),
          ],
        ),
      ),
    );
  }
}
