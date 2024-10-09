import 'package:flutter/material.dart';
import 'package:mini_chat/features/home/presentation/views/call_screen.dart';
import 'package:mini_chat/features/home/presentation/views/chat_screen.dart';
import 'package:mini_chat/features/home/presentation/views/status_screen.dart';
import 'package:mini_chat/features/home/presentation/views/widgets/bottom_navigation_bar.dart';
import 'package:mini_chat/features/home/presentation/views/widgets/build_floating_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  List<Widget> screens = const [
    ChatsScreen(),
    StatusScreen(),
    CallScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: screens[index],
      floatingActionButton: buildFloatingButton(onPressed: () {}),
      bottomNavigationBar: buildNavigationBar(
        index: index,
        onTap: (int tapped) {
          setState(() {
            index = tapped;
          });
        },
      ),
    );
  }
}
