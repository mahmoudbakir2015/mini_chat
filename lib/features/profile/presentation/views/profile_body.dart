import 'package:flutter/material.dart';
import 'package:mini_chat/core/constants/app_assets.dart';
import 'package:mini_chat/core/widget/build_stack_avatar.dart';
import 'package:mini_chat/features/profile/presentation/views/widgets/profile_form.dart';
import 'package:mini_chat/features/profile/presentation/views/widgets/profile_save_button.dart';

SingleChildScrollView buildProfileBody(TextEditingController name,
    TextEditingController phone, BuildContext context) {
  return SingleChildScrollView(
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
          Padding(
            padding: const EdgeInsets.only(
              top: 30,
            ),
            child: buildSaveProfileButton(context),
          ),
        ],
      ),
    ),
  );
}
