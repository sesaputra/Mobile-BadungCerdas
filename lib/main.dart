import 'package:flutter/material.dart';
// Ganti 'project_pkl' dengan nama folder project Anda
// import 'package:project_pkl/screens/home_screen.dart';
import 'package:project_pkl/screens/welcome_screen.dart';

void main() {
  runApp(const BeasiswaApp());
}

class BeasiswaApp extends StatelessWidget {
  const BeasiswaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beasiswa Badung Cerdas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      home: const WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
