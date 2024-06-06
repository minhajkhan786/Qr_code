import 'package:flutter/material.dart';
import 'qr_generator.dart';
import 'qr_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart'; // Add this import
import 'package:url_launcher/url_launcher.dart';
import 'feedback_form_page.dart';
import 'profile.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code Generator & Scanner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QRCode Generator & Scanner'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  QrImageView(
                    data: 'https://example.com',
                    size: 100,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'QRCode Generator & Scanner',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('Contact Us'),
              onTap:
                _launchEmail
                // Handle the contact us action

            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Share Us'),
              onTap: () {
                // Handle the share us action
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Rate Us'),
              onTap: () {
                // Handle the rate us action
              },
            ),
            ListTile(
              leading: Icon(Icons.feedback),
              title: Text('Send Feedback'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>FeedbackFormPage()),
                );
                // Handle the send feedback action
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('History'),
              onTap: () {
                // Handle the history action
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 3,
          children: <Widget>[
            _buildGridItem(context, 'Profile', Icons.person, ProfilePage()),

            _buildGridItem(context, 'Business', Icons.business, 'BIZCARD:N:John Doe;X:CEO;T:1234567890;E:john.doe@example.com;W:www.example.com;C:Example Inc;;'),
            _buildGridItem(context, 'Contact', Icons.contact_phone, 'tel:1234567890'),
            _buildGridItem(context, 'Message', Icons.message, 'sms:1234567890:Hello'),
            _buildGridItem(context, 'Text', Icons.text_fields, 'Hello World'),
            _buildGridItem(context, 'Mail', Icons.email, 'mailto:john.doe@example.com'),
            _buildGridItem(context, 'Website', Icons.web, 'https://www.example.com'),
            _buildGridItem(context, 'Company', Icons.people, 'COMPANY:Example Inc;ADDRESS:1234 Street Name, City, Country;;'),
            _buildGridItem(context, 'Rate Us', Icons.star, 'https://www.example.com/rateus'),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => QrGeneratorPage(qrData: 'Hello World')));
              },
              child: Text('Generate QR Code'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => QrScannerPage()));
              },
              child: Text('Scan QR Code'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, String title, IconData icon, String data) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QrGeneratorPage(qrData: data),
            ),
          );
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(icon, size: 50.0),
              SizedBox(height: 10.0),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}


void _launchEmail() async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'minhajnbd7501@gmail.com',
    query: 'subject=Feedback&body=Please write your feedback here.',
  );

  if (await canLaunch(emailLaunchUri.toString())) {
    await launch(emailLaunchUri.toString());
  } else {
    throw 'Could not launch $emailLaunchUri';
  }
}
