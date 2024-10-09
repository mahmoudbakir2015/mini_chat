import 'package:flutter/material.dart';

BottomNavigationBar buildNavigationBar(
    {required int index, required void Function(int)? onTap}) {
  return BottomNavigationBar(
    selectedItemColor: Colors.green,
    onTap: onTap,
    currentIndex: index,
    items: const [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.chat,
        ),
        label: 'Chats',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.notification_add_sharp,
        ),
        label: 'Status',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.call,
        ),
        label: 'Calls',
      ),
    ],
  );
}
