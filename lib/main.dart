import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mini_chat/core/utils/observer.dart';
import 'package:mini_chat/features/profile/presentation/views/profile.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';

void main() {
  Bloc.observer = MyBlocObserver();
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
      home: const Profile(),
    );
  }
}
