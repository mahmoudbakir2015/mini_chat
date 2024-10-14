import 'package:flutter/material.dart';
import 'package:mini_chat/core/constants/app_assets.dart';
import 'package:mini_chat/core/widget/build_stack_avatar.dart';
import 'package:mini_chat/features/profile/presentation/views/widgets/profile_bottom_sheet.dart';
import 'package:mini_chat/features/profile/presentation/views/widgets/profile_form.dart';
import 'package:mini_chat/features/profile/presentation/views/widgets/profile_save_button.dart';

class ProfileBody extends StatefulWidget {
  final TextEditingController name;
  final TextEditingController phone;
  const ProfileBody({super.key, required this.name, required this.phone});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: InkWell(
                onTap: () {
                  Scaffold.of(context).showBottomSheet(
                    (context) => const ProfileBottomSheet(),
                  );
                },
                child: buildStackAvatar(
                  image: AppAssets.imageTest,
                  isProfile: true,
                ),
              ),
            ),
            buildProfileForm(widget.name, widget.phone),
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
}
