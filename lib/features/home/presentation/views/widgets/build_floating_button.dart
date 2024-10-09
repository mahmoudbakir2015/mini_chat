import 'package:flutter/material.dart';

FloatingActionButton buildFloatingButton(
    {required void Function()? onPressed}) {
  return FloatingActionButton(
    backgroundColor: Colors.green,
    onPressed: onPressed,
    child: const Icon(
      Icons.chat,
      color: Colors.white,
    ),
  );
}
