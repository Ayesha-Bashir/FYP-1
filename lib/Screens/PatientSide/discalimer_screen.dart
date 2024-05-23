import 'package:flutter/material.dart';

import '../../constant.dart';

class DisclaimerScreen extends StatefulWidget {
  const DisclaimerScreen({super.key});

  @override
  State<DisclaimerScreen> createState() => _DisclaimerScreenState();
}

class _DisclaimerScreenState extends State<DisclaimerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,
        title: const Text(
          'Disclaimer',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50))),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Disclaimer',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'The Smart Plant Monitoring app provides tools and features to help users monitor and care for their plants. While we strive to offer accurate and up-to-date information, the app should not be considered a substitute for professional advice. The diagnostic tools and recommendations are based on algorithms and user inputs, and may not always be accurate or applicable to every situation.',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Users are advised to consult with a professional horticulturist or plant care specialist for personalized advice and treatment options. The app\'s auto-watering feature should be used with caution, and users should monitor their plants regularly to ensure optimal health.',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Smart Plant Monitoring is not responsible for any damage or loss resulting from the use of the app. By using this app, you agree to use it at your own risk and accept that the developers are not liable for any issues that may arise.',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'We are continuously working to improve our app and welcome your feedback. If you encounter any issues or have suggestions, please contact us through the feedback feature or via our support channels.',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
