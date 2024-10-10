import 'package:flutter/material.dart';

/*************  ✨ Codeium Command ⭐  *************/
/// A SizedBox whose height is 3% of the screen height. This is used
/// as a divider between widgets.
/// ****  7954727c-c974-45a9-85d7-f466e7ff1c0e  ******
SizedBox buildCustomDivider(BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.03,
    width: MediaQuery.of(context).size.width * 0.03,
  );
}
