import 'package:flutter/material.dart';
import 'package:mini_chat/core/theme/app_color.dart';
import 'package:mini_chat/features/chat/presentation/views/chat_body.dart';
import 'package:mini_chat/features/chat/presentation/views/widgets/chat_app_bar.dart';
import 'package:mini_chat/features/chat/presentation/views/widgets/send_message.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return // BlocProvider(
        //   create: (context) => ChatCubit(),
        //   child: BlocBuilder<ChatCubit, ChatStates>(
        //     builder: (context, state) {
        //       ChatCubit chatCubit = ChatCubit.get(context);
        //       return
        Scaffold(
      backgroundColor: AppColor.chatBackgroundColor,
      appBar: buildChatAppBar(context: context),
      body: const ChatBody(),
      bottomNavigationBar: senderMessage(context: context),
    );
  }
}
