import 'package:flutter/material.dart';
import 'package:mini_chat/features/splash_screen/presentation/views/widgets/whats_app_text.dart';
import 'package:mini_chat/features/splash_screen/presentation/views/widgets/whats_app_widget.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildWhatsAppIcon(context),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          buildTextSplash(context),
        ],
      ),
    );
  }
}
