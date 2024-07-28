


import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_request_body.g.dart';

@JsonSerializable()
class LoginRequestBody {
  final String identifier;
  final String password;

  LoginRequestBody({required this.identifier, required this.password});

  Map<String , dynamic> toJson() => _$LoginRequestBodyToJson(this);

}