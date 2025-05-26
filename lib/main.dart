import 'package:flutter/material.dart';
import 'package:AR_Project/screen/login.dart'; // 👈 import หน้าล็อกอิน

void main() {
  runApp(const MyApp()); // 👈 ต้องมี runApp ด้วย
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Power Fitness',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const LoginPage(), // 👈 เริ่มที่ LoginPage
    );
  }
}