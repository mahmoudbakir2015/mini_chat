import 'package:flutter/material.dart';
import 'package:mini_chat/core/theme/app_styles.dart';
import 'package:mini_chat/core/widget/build_custom_divider.dart';
import 'package:mini_chat/features/chat/presentation/views/widgets/build_app_bar_icon.dart';

buildChatAppBar({required BuildContext context}) => AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: const Icon(Icons.arrow_back_ios_new),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CircleAvatar(),
          buildCustomDivider(context),
          const Text(
            'MAI',
            style: AppStyles.textBoldBlack_25,
          ),
        ],
      ),
      actions: [
        buildAppBarIcon(
          icon: Icons.videocam_rounded,
          onTap: () {},
        ),
        buildAppBarIcon(
          icon: Icons.call,
          onTap: () {},
        ),
        buildAppBarIcon(
          icon: Icons.list,
          onTap: () {},
        ),
      ],
    );
