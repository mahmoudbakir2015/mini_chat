import 'package:flutter/material.dart';
import 'package:mini_chat/features/whats/presentation/views/chats_card/chats_view_cards.dart';
import 'package:mini_chat/features/whats/presentation/views/custom_app_bar.dart';
import 'package:mini_chat/features/whats/presentation/views/status/status_view.dart';

class WhatsView extends StatefulWidget {
  const WhatsView({super.key});

  @override
  State<WhatsView> createState() => _WhatsViewState();
}

class _WhatsViewState extends State<WhatsView> {
  @override
/*************  ✨ Codeium Command ⭐  *************/
  /// Returns a [DefaultTabController] widget with a [Scaffold] widget as its
  /// child.
  ///
  /// The [Scaffold] widget contains a [CustomAppBar] widget as its app bar, and
  /// a [TabBarView] widget as its body. The [TabBarView] widget contains three
  /// children: [ChatsView], [StatusView], and a [Text] widget with the text
  /// 'Calls'. The [DefaultTabController] widget is used to manage the state of
  /// the tabs in the [TabBarView].
  ///
  /// The [DefaultTabController] widget returned by this method is the root of
  /// the [MaterialApp] widget tree for the whats screen.
  /// ****  900ace99-63ca-46d8-972d-6bae716ae955  ******
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
