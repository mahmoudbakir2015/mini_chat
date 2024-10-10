import 'package:flutter/material.dart';
import 'package:mini_chat/core/theme/app_color.dart';
import 'package:mini_chat/core/widget/build_custom_divider.dart';

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
