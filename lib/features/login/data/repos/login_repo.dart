import 'package:medical_app/core/networking/api_error_handler.dart';
import 'package:medical_app/core/networking/api_result.dart';
import 'package:medical_app/core/networking/api_service.dart';
import 'package:medical_app/features/login/data/models/login_response.dart';

import '../models/login_request_body.dart';

class LoginRepo {
  final ApiService apiService;

  LoginRepo(this.apiService);

  Future<ApiResult<LoginResponse>> login(
        LoginRequestBody loginRequestBody
      ) async{
      try {
        final response = await apiService.login(loginRequestBody);
        return ApiResult.success(response);
      } catch (error) {
        return ApiResult.failure(ErrorHandler.handle(error));
      }

  }
}
