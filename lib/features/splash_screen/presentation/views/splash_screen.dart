import 'package:flutter/material.dart';
import 'package:mini_chat/features/home/presentation/views/home.dart';
import 'package:mini_chat/features/splash_screen/presentation/views/splash_body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
/*************  ✨ Codeium Command ⭐  *************/
  /// After a 4 second delay, push the [Home] widget onto the top of the
  /// navigator that most tightly encloses the given [context], and remove all
  /// the previous routes until the pushed route is the only one left.
  ///
  /// ****  01c40b87-ca36-4f1c-b46d-51afefd12db1  ******
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4)).then((onValue) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const Home()),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBody(),
    );
  }
}
