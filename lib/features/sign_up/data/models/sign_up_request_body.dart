import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_request_body.g.dart';

@JsonSerializable()
class SignUpRequestBody {
  final String username;
  final String email;
  final String password;

  SignUpRequestBody({
    required this.username,
    required this.email,
    required this.password,
  });

  Map<String , dynamic>  toJson() => _$SignUpRequestBodyToJson(this);

}
