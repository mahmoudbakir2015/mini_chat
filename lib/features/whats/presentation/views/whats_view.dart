import 'package:flutter/material.dart';
import 'package:mini_chat/features/whats/presentation/views/chats/chats_view.dart';
import 'package:mini_chat/features/whats/presentation/views/custom_app_bar.dart';
import 'package:mini_chat/features/whats/presentation/views/status/status_view.dart';

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
        appBar: buildCustomAppBar(context),
        body: const TabBarView(children: [
          ChatsView(),
          StatusView(),
          Text('Calls'),
        ]),
      ),
    );
  }
}
