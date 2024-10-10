import 'package:flutter/material.dart';
import 'package:mini_chat/core/theme/app_color.dart';
import 'package:mini_chat/core/theme/app_styles.dart';
import 'package:mini_chat/features/whats/presentation/views/build_app_bar_icon.dart';

/*************  ✨ Codeium Command ⭐  *************/
/// A custom app bar for the app that contains a logo, a search bar, and a tab bar.
///
/// The logo is a [Text] widget with the text 'WhatsUp' in bold and black.
///
/// The search bar and filter icon are [buildAvatar] widgets.
///
/// The tab bar has three tabs: CHATS, STATUS, and CALLS. The indicator color
/// and label color are set to [AppColor.secondaryColor]. The indicator size
/// is set to [TabBarIndicatorSize.tab] and the indicator weight is set to 3.
///
/// The width of the leading widget is set to 0.4 times of the device's screen
/// width. The padding of the leading widget is set to 30 pixels horizontally
/// and 10 pixels vertically.
/// ****  944c1651-2424-435c-95e8-04176b10ed57  ******
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
