import 'package:flutter/material.dart';

/*************  ✨ Codeium Command ⭐  *************/
/// A ListTile widget which displays information about a chat in the
/// Chats screen. The information includes the chat's image, name, last
/// message, time of the last message, and number of unseen messages. The
/// chat's image is displayed as a CircleAvatar with a radius of 10% of the
/// screen width. The name and last message are displayed in a Column with
/// mainAxisAlignment set to MainAxisAlignment.spaceBetween. The time and
/// number of unseen messages are displayed in a Column with
/// mainAxisAlignment set to MainAxisAlignment.spaceBetween and
/// crossAxisAlignment set to CrossAxisAlignment.center. If the number of
/// unseen messages is not null, it is displayed in a CircleAvatar with
/// backgroundColor set to Colors.green and a radius of 3% of the screen
/// width. Otherwise, a SizedBox is displayed.
/// ****  f545ee7c-a7e8-4d2f-9561-efab6940ed72  ******
ListTile buildTileCardInfo({
  required BuildContext context,
  required String image,
  required String name,
  required String lastMessage,
  required String time,
  String? notSeen,
}) {
  return ListTile(
    leading: CircleAvatar(
      radius: MediaQuery.of(context).size.width * 0.1,
      backgroundImage: NetworkImage(image),
    ),
    title: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name),
        Text(lastMessage),
      ],
    ),
    trailing: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(time),
        (notSeen != null)
            ? CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.03,
                backgroundColor: Colors.green,
                child: Text(
                  notSeen,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            : const SizedBox(),
      ],
    ),
  );
}
