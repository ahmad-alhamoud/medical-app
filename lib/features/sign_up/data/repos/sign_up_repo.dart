import 'package:medical_app/core/networking/api_error_handler.dart';
import 'package:medical_app/core/networking/api_result.dart';
import 'package:medical_app/core/networking/api_service.dart';
import 'package:medical_app/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:medical_app/features/sign_up/data/models/sign_up_response.dart';

class SignUpRepo {
  final ApiService apiService;

  SignUpRepo(this.apiService);

  Future<ApiResult<SignUpResponse>> signup(
      SignUpRequestBody signUpRequestBody) async {
    try {
      final response = await apiService.signup(signUpRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
