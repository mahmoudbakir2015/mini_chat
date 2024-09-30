import 'package:flutter/material.dart';
import 'package:mini_chat/features/splash_screen/presentation/screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Mini What's App ",
      home: SplashScreen(),
    );
  }
}
