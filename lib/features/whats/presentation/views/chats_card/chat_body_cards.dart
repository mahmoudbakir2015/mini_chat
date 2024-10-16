import 'package:flutter/material.dart';
import 'package:mini_chat/core/constants/app_assets.dart';
import 'package:mini_chat/features/whats/presentation/views/chats_card/widgets/tile_card_info_chat.dart';

/*************  ✨ Codeium Command ⭐  *************/
/// A function that builds a list of chat cards.
///
/// It takes no parameters and returns a [ListView] widget.
///
/// The [ListView] widget is built with a [BouncingScrollPhysics] and an item count of 10.
///
/// For each item, it builds a [Padding] widget with a vertical padding of 1% of the screen height.
///
/// The child of the [Padding] widget is a [buildTileCardInfo] widget with the following parameters:
///
/// - [context]: The current [BuildContext].
/// - [image]: The URL of the user's image.
/// - [name]: The user's name.
/// - [lastMessage]: The last message sent by the user.
/// - [time]: The time the last message was sent at.
/// - [notSeen]: The number of unseen messages. If null, the message is not seen.
/// ****  81e9d690-ad3d-4a93-8b70-7c7debe17302  ******
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
          image: AppAssets.imageTest,
          name: 'Mahmoud bakir',
          lastMessage: 'hello',
          time: '12:20 PM',
          notSeen: null,
        ),
      );
    },
  );
}
