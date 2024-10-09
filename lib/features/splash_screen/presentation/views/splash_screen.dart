import 'package:flutter/material.dart';
import 'package:mini_chat/features/auth/presentation/view/sign_in/sign_in.dart';
import 'package:mini_chat/features/home/presentation/views/home.dart';
import 'package:mini_chat/features/splash_screen/presentation/views/splash_body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoaded = false;
  @override

/*************  ✨ Codeium Command ⭐  *************/
  ///
  /// This method is used to initialize the state of this widget.
  ///
  /// It first waits for 1 second and then sets [isLoaded] to true.
  ///
  /// After that, it waits for another 3 seconds and navigates to the
  /// [SignIn] screen.
  ///
  /// The [Future.delayed] method is used to wait for the specified
  /// duration.
  ///
  /// The [Navigator.of(context).pushAndRemoveUntil] method is used to
  /// navigate to the [SignIn] screen and remove all the previous screens
  /// from the navigator stack.
  ///
  /// The [MaterialPageRoute] is used to specify the route to use for the
  /// [SignIn] screen.
/******  efc7ed91-3186-4639-b561-2361ddae18ac  *******/
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then((onValue) {
      setState(() {
        isLoaded = true;
      });
    });
    Future.delayed(const Duration(seconds: 4)).then((onValue) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const SignIn(),
        ),
        (route) => false,
      );
    });
  }

  @override
/*************  ✨ Codeium Command ⭐  *************/
  /// Returns a [Scaffold] widget with a [SplashBody] widget as its body.
  ///
  /// The [SplashBody] widget is a [StatelessWidget] that displays a splash screen
  /// with a logo, a custom divider, and the app's tagline. The [SplashBody] widget
  /// also contains a [StatefulWidget] that handles the loading animation.
  ///
  /// The [SplashScreen] widget returned by this method is the root of the
  /// [MaterialApp] widget tree for the splash screen.
  ///
  /// ****  5a6d4f8e-4c7d-4f5c-9a01-6c41b1b4a15a  ******
/******  804cc5ba-7396-4a6f-8fe4-cf8cc0bc8a9a  *******/
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashBody(
        isLoaded: isLoaded,
      ),
    );
  }
}
