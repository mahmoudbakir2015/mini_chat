import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat/features/home/friends_request/presentation/view/freinds_request.dart';
import 'package:mini_chat/features/whats/data/view_model/chat_cubit.dart';
import 'package:mini_chat/features/whats/presentation/views/chats/chat_list_body.dart';
import 'package:mini_chat/features/whats/presentation/views/chats/widgets/floating_chat.dart';

class ChatsView extends StatefulWidget {
  const ChatsView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChatsViewState createState() => _ChatsViewState();
}

class _ChatsViewState extends State<ChatsView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatCubit(),
      child: Scaffold(
        body: buildBodyOfListOfChat(),
        floatingActionButton: buildFloatingChat(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => FriendRequestsScreen(),
            ));
          },
        ),
      ),
    );
  }
}
