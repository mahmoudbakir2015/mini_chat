import 'package:flutter/material.dart';
import 'package:mini_chat/core/constants/app_assets.dart';
import 'package:mini_chat/core/widget/build_stack_avatar.dart';

/*************  ✨ Codeium Command ⭐  *************/
/// A [ListTile] for the "My Status" item in the status page.
///
/// The tile displays a profile picture, a "My Status" title, and a "Tap to add
/// status update" subtitle. The profile picture is a [CircleAvatar] with a
/// white border and a red "add" icon at the bottom right corner. The title and
/// subtitle are [Text] widgets with black text and bold font style. The
/// [onTap] callback is called when the tile is tapped.
///
/// The [image] parameter is the URL of the profile picture, and the [onTap]
/// parameter is the callback to call when the tile is tapped.
/// ****  72bada56-38b3-4973-a255-babdea6d3311  ******
ListTile buildMyStatus({required String image, void Function()? onTap}) {
  return ListTile(
    leading: buildStackAvatar(image: AppAssets.imageTest),
    title:
        const Text('My Status', style: TextStyle(fontWeight: FontWeight.bold)),
    subtitle: const Text('Tap to add status update'),
    onTap: onTap,
  );
}
