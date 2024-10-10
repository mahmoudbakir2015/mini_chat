import 'package:flutter/material.dart';
import 'package:mini_chat/core/theme/app_color.dart';
import 'package:mini_chat/core/widget/build_custom_divider.dart';

/*************  ✨ Codeium Command ⭐  *************/
/// A row widget that contains two [CircleAvatar]s and a custom divider.
///
/// The first [CircleAvatar] is used to edit the status. The second
/// [CircleAvatar] is used to take a picture for the status. The divider is
/// used to separate the two [CircleAvatar]s.
///
/// The [mainAxisAlignment] of the [Row] is set to [MainAxisAlignment.end],
/// meaning the [CircleAvatar]s are aligned to the right of the screen.
///
/// The [children] of the [Row] are the two [CircleAvatar]s and the divider.
///
/// The [onTap] callback of the [InkWell] of the edit [CircleAvatar] is the
/// [edit] parameter.
///
/// The [onTap] callback of the [InkWell] of the camera [CircleAvatar] is the
/// [camera] parameter.
///
/// The [buildCustomDivider] widget is used to create the divider.
///
/// The [context] parameter is used to get the size of the screen, which is
/// used to set the width of the divider.
/// ****  d11d2c3f-6b5b-46c7-8e9d-5ee6345f6b7d  ******
Row buildStatusFloating(
    {required BuildContext context,
    void Function()? edit,
    void Function()? camera}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      InkWell(
        onTap: edit,
        child: const CircleAvatar(
          backgroundColor: AppColor.lightColor,
          child: Icon(
            Icons.edit,
            color: AppColor.secondaryColor,
          ),
        ),
      ),
      buildCustomDivider(context),
      InkWell(
        onTap: camera,
        child: const CircleAvatar(
          backgroundColor: AppColor.secondaryColor,
          child: Icon(
            Icons.camera_alt_outlined,
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
}
