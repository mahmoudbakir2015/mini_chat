import 'package:flutter/material.dart';

/*************  ✨ Codeium Command ⭐  *************/
/// A function to build a text with light color.
/// The text is 'Other Status' or 'My Status'.
/// The text is centered horizontally and vertically in the parent widget.
/// The text is styled with a color of 0xff899199.
/// ****  b3e102de-9f78-4d61-a041-96faee36f481  ******
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
