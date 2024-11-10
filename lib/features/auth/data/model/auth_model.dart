class AuthModel {
  final String email;
  String? name = 'Name';
  String? phone = '01010000000';
  final String password;
  AuthModel({
    required this.email,
    this.name,
    this.phone,
    required this.password,
  });
}
