import 'package:flutter/material.dart';
import 'package:mini_chat/core/theme/app_color.dart';
import 'package:mini_chat/core/theme/app_styles.dart';
import 'package:mini_chat/features/whats/presentation/views/build_app_bar_icon.dart';

AppBar buildCustomAppBar(BuildContext context) {
  return AppBar(
    leadingWidth: MediaQuery.of(context).size.width * 0.4,
    leading: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        'WhatsUp',
        style: AppStyles.textBoldBlack_25,
      ),
    ),
    actions: [
      buildAvatar(
        context: context,
        icon: Icons.search,
        onTap: () {},
      ),
      buildAvatar(
        context: context,
        icon: Icons.filter_list,
        onTap: () {},
      ),
    ],
    bottom: const TabBar(
        indicatorColor: AppColor.secondaryColor,
        labelColor: AppColor.secondaryColor,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorWeight: 3,
        tabs: [
          Tab(
            child: Text('CHATS'),
          ),
          Tab(
            child: Text('STATUS'),
          ),
          Tab(
            child: Text('CALLS'),
          ),
        ]),
  );
}
