import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mindsphere/Home%20Screen/Home.dart';
import 'package:mindsphere/Onboarding%20Screen/Onboarding_Screen.dart';
import 'package:mindsphere/Sign%20in%20Screen/login.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Use currentPlatform directly
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mind Sphere',
      home: OnboardingScreen(),
    );
  }
}