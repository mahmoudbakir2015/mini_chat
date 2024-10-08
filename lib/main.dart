import 'package:flutter/material.dart';
import 'package:mini_chat/features/splash_screen/presentation/views/splash_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: "Mini What's App ",
      home: const SplashScreen(),
    );
  }
}
