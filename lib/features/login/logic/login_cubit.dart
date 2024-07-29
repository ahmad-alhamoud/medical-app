import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'package:medical_app/core/di/injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constant/shared_preferance/shared_preferance_keys.dart';
import '../../../core/networking/dio_factory.dart';
import '../data/models/login_request_body.dart';
import '../data/repos/login_repo.dart';
import 'login_state.dart';



class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo ;
  LoginCubit(this.loginRepo) : super(const LoginState.initial());


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();



  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await loginRepo.login(
        LoginRequestBody(identifier: emailController.text, password: passwordController.text)
    );
    response.when(
        success: (loginResponse) async{
          final prefs = serviceLocator<SharedPreferences>();
          await saveUserToken(loginResponse.jwt);
          emit(LoginState.success(loginResponse));
        },
        failure: (error) {
          emit(LoginState.error(error: error.apiErrorModel.message ?? 'Some Thing Went Wrong' )) ;
        });
  }

  Future<void> saveUserToken(String token) async {
    final prefs = serviceLocator<SharedPreferences>() ;
    await  prefs.setString(SharedPreferanceKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
}
