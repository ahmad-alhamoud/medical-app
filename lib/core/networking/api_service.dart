import 'package:dio/dio.dart';
import 'package:medical_app/features/login/data/models/login_response.dart';
import 'package:medical_app/features/sign_up/data/models/sign_up_response.dart';

import 'package:retrofit/http.dart';

import '../../features/contact_us/data/models/contact_us_request_body.dart';
import '../../features/login/data/models/login_request_body.dart';
import '../../features/sign_up/data/models/sign_up_request_body.dart';
import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

    @POST(ApiConstants.signup)
    Future<SignUpResponse> signup(
        @Body() SignUpRequestBody signUpRequestBody
        );

    @POST(ApiConstants.login)
    Future<LoginResponse> login(
        @Body() LoginRequestBody loginRequestBody
        );
    
    @POST(ApiConstants.contactUs)
    Future<String> contactUs(
        @Body() ContactUsRequestBody contactUsRequestBody
        );


  // @POST(ApiConstants.login)
  // Future<LoginResponse> login(
  //     @Body() LoginRequestBody loginRequestBody);
  //
  // @POST(ApiConstants.signup)
  // Future<SignupResponse> signup(
  //     @Body()  SignupRequestBody signupRequestBody
  //     );
}





