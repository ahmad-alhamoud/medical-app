
import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_up_response.g.dart';


@JsonSerializable()
class SignUpResponse {
  final String jwt;
   User user;

  SignUpResponse({
    required this.jwt,
    required this.user
});

  factory SignUpResponse.fromJson(Map<String,dynamic> json) => _$SignUpResponseFromJson(json);

}


@JsonSerializable()
class Role {
  int id;
  String name;
  String description;
  String type;
  DateTime createdAt;
  DateTime updatedAt;

  Role({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
});

  factory Role.fromJson(Map<String,dynamic> json) => _$RoleFromJson(json) ;
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
  Role role;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.provider,
    required this.confirmed,
    required this.blocked,
    required this.createdAt,
    required this.updatedAt,
    required this.role
}) ;

  factory User.fromJson(Map<String , dynamic> json) => _$UserFromJson(json);

}