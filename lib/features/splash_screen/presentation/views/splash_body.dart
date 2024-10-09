import 'package:flutter/material.dart';
import 'package:mini_chat/core/widget/build_custom_divider.dart';
import 'package:mini_chat/core/widget/build_logo.dart';
import 'package:mini_chat/features/splash_screen/presentation/views/widgets/build_text_splash.dart';

// ignore: must_be_immutable
class SplashBody extends StatelessWidget {
  bool isLoaded;
  SplashBody({super.key, required this.isLoaded});

  @override
/*************  ✨ Codeium Command ⭐  *************/
  /// Returns a [SafeArea] widget with a [Column] widget as its child. The
  /// [Column] widget is centered horizontally and vertically in the parent
  /// [SafeArea] widget.
  ///
  /// The [mainAxisAlignment] of the [Column] is set to [MainAxisAlignment.center].
  ///
  /// The [crossAxisAlignment] of the [Column] is set to [CrossAxisAlignment.center].
  ///
  /// The [children] of the [Column] are a logo, a divider, and a text depending on the
  /// [isLoaded] parameter.
  ///
  /// If [isLoaded] is true, the text is displayed. Otherwise, an empty [SizedBox] is
  /// displayed instead.
  ///
  /// The size of the [SizedBox] is determined by the size of the parent [SafeArea]
  /// widget.
/******  49eb92a3-b23a-4dcc-82f9-026028866f49  *******/
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
