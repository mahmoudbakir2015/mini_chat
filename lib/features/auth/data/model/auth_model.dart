class AurhModel {
  final String email;
  String? name = 'Name';
  String? phone = '01010000000';
  final String password;
  AurhModel({
    required this.email,
    this.name,
    this.phone,
    required this.password,
  });
}
