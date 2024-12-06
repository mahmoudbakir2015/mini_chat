import 'package:mini_chat/core/constants/app_assets.dart';

class AuthModel {
  final String email;
  String? name;
  String? phone;
  String? image;

  final String password;
  AuthModel({
    required this.email,
    this.name,
    this.image = AppAssets.defaultImage,
    this.phone,
    required this.password,
  });
}
