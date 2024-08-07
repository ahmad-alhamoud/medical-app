import 'package:dio/dio.dart';
import 'package:medical_app/features/allargie/data/models/allargie_response_body.dart';
import 'package:medical_app/features/blog/data/models/blog_response_body.dart';
import 'package:medical_app/features/contact_us/data/models/contact_us_reponse.dart';
import 'package:medical_app/features/disease/data/models/diseases_response_body.dart';
import 'package:medical_app/features/login/data/models/login_response.dart';
import 'package:medical_app/features/presecrption/data/models/presecrption_response_body.dart';
import 'package:medical_app/features/session/data/models/session_response_body.dart';
import 'package:medical_app/features/sign_up/data/models/sign_up_response.dart';

import 'package:retrofit/http.dart';

import '../../features/contact_us/data/models/contact_us_request_body.dart';
import '../../features/login/data/models/login_request_body.dart';
import '../../features/profile/data/models/profile_response_body.dart';
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
    Future<ContactUsResponse> contactUs(
        @Body() ContactUsRequestBody contactUsRequestBody
        );

    @GET(ApiConstants.allBlogs)
    Future<BlogResponseBody> getAllBlogs();

  @GET(ApiConstants.sessions)
  Future<SessionResponseBody> getAllSessions();


  @GET(ApiConstants.diseases)
  Future<DiseaseResponseBody> getAllDiseases();


  @GET(ApiConstants.allargies)
  Future<AllargieResponseBody> getAllAllargies();

  @GET(ApiConstants.profile)
  Future<ProfileResponseBody> getPatientProfile();

  @GET(ApiConstants.presecrption)
  Future<PrescriptionResponseBody> getAllPresecrption();

  // @POST(ApiConstants.login)
  // Future<LoginResponse> login(
  //     @Body() LoginRequestBody loginRequestBody);
  //
  // @POST(ApiConstants.signup)
  // Future<SignupResponse> signup(
  //     @Body()  SignupRequestBody signupRequestBody
  //     );
}





