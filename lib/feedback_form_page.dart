import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FeedbackFormPage extends StatefulWidget {
  @override
  _FeedbackFormPageState createState() => _FeedbackFormPageState();
}

class _FeedbackFormPageState extends State<FeedbackFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _feedbackController = TextEditingController();

  Future<void> _sendFeedback() async {
    if (_formKey.currentState!.validate()) {
      // Send feedback to REST API
      final response = await http.post(
        Uri.parse('https://example.com/api/feedback'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'feedback': _feedbackController.text,
        }),
      );

      if (response.statusCode == 200) {
        // Clear the text field
        _feedbackController.clear();

        // Show a confirmation message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Feedback sent successfully!')),
        );
      } else {
        // Show an error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send feedback. Please try again.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _feedbackController,
                decoration: InputDecoration(labelText: 'Enter your feedback'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your feedback';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _sendFeedback,
                child: Text('Send Feedback'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
