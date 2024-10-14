import 'package:flutter/material.dart';
import 'package:mini_chat/features/profile/presentation/views/profile_body.dart';
import 'package:mini_chat/features/profile/presentation/views/widgets/profile_app_bar.dart';
// ignore: depend_on_referenced_packages

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();

    TextEditingController phone = TextEditingController();
    return Scaffold(
      appBar: buildProfileAppBar(context),
      body: ProfileBody(
        name: name,
        phone: phone,
      ),
    );
  }
}
