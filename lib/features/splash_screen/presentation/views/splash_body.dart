import 'package:flutter/material.dart';
import 'package:mini_chat/core/widget/build_custom_divider.dart';
import 'package:mini_chat/core/widget/build_logo.dart';
import 'package:mini_chat/features/splash_screen/presentation/views/widgets/build_text_splash.dart';

// ignore: must_be_immutable
class SplashBody extends StatelessWidget {
  bool isLoaded;
  SplashBody({super.key, required this.isLoaded});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildLogo(context),
          buildCustomDivider(context),
          isLoaded ? buildTextSplash(context) : const SizedBox(),
        ],
      ),
    );
  }
}
