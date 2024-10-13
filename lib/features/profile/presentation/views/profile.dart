import 'package:flutter/material.dart';
import 'package:mini_chat/features/profile/presentation/views/widgets/profile_app_bar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildProfileAppBar(context),
    );
  }
}
