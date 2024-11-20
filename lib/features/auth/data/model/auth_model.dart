class AuthModel {
  final String email;
  String? name;
  String? phone;
  String? image;
  final String password;
  AuthModel({
    required this.email,
    this.name,
    this.phone,
    required this.password,
  });
}
