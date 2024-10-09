import 'package:flutter/material.dart';
import 'package:mini_chat/features/auth/presentation/view/sign_in/sign_in_body.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
/*************  ✨ Codeium Command ⭐  *************/
  /// Returns a [Scaffold] which contains a [Center] widget with a [SignInBody]
  /// widget.
  ///
  /// The [SignInBody] is a widget which contains a logo, a form to sign in,
  /// and a button to sign in.
  ///
  /// The [Scaffold] is used to provide a default background and a default
  /// [AppBar] to the [SignInBody].
  ///
  /// The [Center] widget is used to center the [SignInBody] horizontally and
  /// vertically.
  ///
  /// ****  ae688296-d2aa-4d2c-8a17-715d524fa0e1  ******
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SignInBody(),
      ),
    );
  }
}
