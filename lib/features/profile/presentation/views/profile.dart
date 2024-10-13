import 'package:flutter/material.dart';
import 'package:mini_chat/core/constants/app_assets.dart';
import 'package:mini_chat/core/widget/build_stack_avatar.dart';
import 'package:mini_chat/features/profile/presentation/views/widgets/profile_app_bar.dart';
import 'package:mini_chat/features/profile/presentation/views/widgets/profile_form.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();

    TextEditingController phone = TextEditingController();
    return Scaffold(
      appBar: buildProfileAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: buildStackAvatar(
                  image: AppAssets.imageTest,
                  isProfile: true,
                ),
              ),
              buildProfileForm(name, phone),
            ],
          ),
        ),
      ),
    );
  }
}
