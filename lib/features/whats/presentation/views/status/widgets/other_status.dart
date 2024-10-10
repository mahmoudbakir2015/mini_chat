import 'package:flutter/material.dart';
import 'package:mini_chat/core/theme/app_color.dart';

/*************  ✨ Codeium Command ⭐  *************/
/// A ListTile to represent other people's status.
///
/// The [image] parameter is the URL for the image of the user.
///
/// The [isViewed] parameter is a boolean that indicates whether the status is viewed or not.
/// If it is viewed, the avatar is grey, otherwise it is the secondary color.
///
/// The [name] parameter is the name of the user.
///
/// The [time] parameter is the time that the status was updated.
///
/// The [onTap] parameter is an optional function that is called when the ListTile is tapped.
/// ****  6e3a1aa0-4486-4ad2-b146-aac3ad9ee7fa  ******
ListTile buildOtherStatus({
  required String image,
  required bool isViewed,
  required String name,
  required String time,
  void Function()? onTap,
}) {
  return ListTile(
    leading: CircleAvatar(
      radius: 30,
      backgroundColor: isViewed ? Colors.grey : AppColor.secondaryColor,
      child: CircleAvatar(
        radius: 26,
        backgroundImage: NetworkImage(
          image,
        ),
      ),
    ),
    title: Text(
      name,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
    subtitle: Text(
      time,
      style: const TextStyle(
        color: Colors.grey,
      ),
    ),
    onTap: onTap,
  );
}
