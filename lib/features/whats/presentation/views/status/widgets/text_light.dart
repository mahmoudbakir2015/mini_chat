import 'package:flutter/material.dart';

Padding buildTextLight({required String text}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 20,
    ),
    child: Text(
      text,
      style: const TextStyle(
        color: Color(0xff899199),
      ),
    ),
  );
}
