import 'package:flutter/material.dart';
import 'package:mini_chat/core/theme/app_styles.dart';
import 'package:mini_chat/features/whats/presentation/views/chats/chats_view.dart';

class WhatsView extends StatefulWidget {
  const WhatsView({super.key});

  @override
  State<WhatsView> createState() => _WhatsViewState();
}

class _WhatsViewState extends State<WhatsView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: MediaQuery.of(context).size.width * 0.25,
          leading: const Text(
            'WhatsUp',
            style: AppStyles.textBoldBlack_25,
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
              indicatorColor: Colors.green,
              labelColor: Colors.green,
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
        ),
        body: const TabBarView(children: [
          ChatsView(),
          Text('Status'),
          Text('Calls'),
        ]),
      ),
    );
  }

  buildAvatar(
      {required BuildContext context,
      required IconData? icon,
      void Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.width * 0.1,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(
              8,
            ),
          ),
          child: Icon(
            icon,
            size: 30,
          ),
        ),
      ),
    );
  }
}
