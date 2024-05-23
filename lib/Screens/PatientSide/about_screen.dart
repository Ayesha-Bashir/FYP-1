import 'package:flutter/material.dart';

import '../../constant.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 70,
        title: const Text(
          'About Us',
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
                'About Our App',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Smart Plant Monitoring is your go-to app for all your plant care needs. Whether you are a beginner or a seasoned gardener, our app offers the tools and features you need to ensure your plants thrive.',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Why Choose Us?',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '1. Comprehensive Plant Care: From adding plant details to diagnosing diseases and monitoring moisture levels, we provide an all-in-one solution.',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '2. User-Friendly Interface: Our app is designed with simplicity in mind, making it easy for anyone to use.',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '3. Expert Support: Get help and advice from our team of plant care specialists via WhatsApp.',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Benefits',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '- Keep Your Plants Healthy: Receive daily tips and recommendations tailored to your plants\' needs.',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '- Save Time and Effort: Use our premium auto-watering feature to effortlessly maintain optimal moisture levels.',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '- Stay Organized: Manage all your plant details and care routines in one place.',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Thank you for choosing Smart Plant Monitoring as your trusted plant care companion. We are dedicated to helping you grow healthy and beautiful plants effortlessly.',
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
