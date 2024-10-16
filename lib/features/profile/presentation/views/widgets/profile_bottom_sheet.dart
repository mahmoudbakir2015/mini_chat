import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:image_picker/image_picker.dart';
import 'package:mini_chat/features/profile/presentation/views/widgets/build_image_provider.dart';

class ProfileBottomSheet extends StatefulWidget {
  const ProfileBottomSheet({super.key});

  @override
  State<ProfileBottomSheet> createState() => _ProfileBottomSheetState();
}

class _ProfileBottomSheetState extends State<ProfileBottomSheet> {
  final ImagePicker _picker = ImagePicker();
  XFile? imageFile;
  Future<void> pickImage({required ImageSource source}) async {
    final pickedFile = await _picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        imageFile = pickedFile;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      decoration: const BoxDecoration(
        border: Border(),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildImageProvider(onTap: () {
            pickImage(
              source: ImageSource.gallery,
            ).then((onValue) {
              // ignore: use_build_context_synchronously
              Navigator.of(context).pop();
            });
          }),
          buildImageProvider(
              isGallery: false,
              onTap: () {
                pickImage(
                  source: ImageSource.camera,
                ).then((onValue) {
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pop();
                });
              }),
        ],
      ),
    );
  }
}
