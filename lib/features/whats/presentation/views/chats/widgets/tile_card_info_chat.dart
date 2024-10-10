import 'package:flutter/material.dart';

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
