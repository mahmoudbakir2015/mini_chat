import 'package:flutter/material.dart';
import 'package:mini_chat/features/whats/presentation/views/chats/widgets/tile_card_info_chat.dart';

ListView buildBodyChat() {
  return ListView.builder(
    physics: const BouncingScrollPhysics(),
    itemCount: 10,
    itemBuilder: (context, index) {
      return Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01,
        ),
        child: buildTileCardInfo(
          context: context,
          image: '',
          name: 'Mahmoud bakir',
          lastMessage: 'hello',
          time: '12:20 PM',
          notSeen: null,
        ),
      );
    },
  );
}
