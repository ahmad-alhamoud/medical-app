import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_response.g.dart';


@JsonSerializable()
class LoginResponse {
  final String jwt;
  final User user;

  LoginResponse({required this.jwt, required this.user});

 factory LoginResponse.fromJson(Map<String,dynamic> json) => _$LoginResponseFromJson(json);

}

@JsonSerializable()
class User {
  int id;
  String username;
  String email;
  String provider;
  bool confirmed;
  bool blocked;
  DateTime createdAt;
  DateTime updatedAt;

  User(
      {required this.id,
      required this.username,
      required this.email,
      required this.provider,
      required this.confirmed,
      required this.blocked,
      required this.createdAt,
      required this.updatedAt});

 factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
