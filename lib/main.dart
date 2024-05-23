import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:optiscan/Screens/AdminSide/AdminDashboard/admin_dashboard.dart';
import 'package:optiscan/Screens/PatientSide/EyeScan/eyescan_intro.dart';
import 'package:optiscan/Screens/PatientSide/Results/results.dart';
import 'package:optiscan/Screens/PatientSide/help_screen.dart';
import 'package:optiscan/Screens/PatientSide/home_screen.dart';
import 'package:optiscan/Screens/SplashScreen/splashscreen.dart';
import 'package:optiscan/constant.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      title: 'Smart Planting App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
