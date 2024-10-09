import 'package:flutter/material.dart';
import 'package:mini_chat/features/auth/presentation/view/register/register_body.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: RegisterBody(),
      ),
    );
  }
}
