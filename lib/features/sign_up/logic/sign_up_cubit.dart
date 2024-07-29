import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/core/constant/shared_preferance/shared_preferance_keys.dart';
import 'package:medical_app/core/di/injection.dart';

import 'package:medical_app/features/sign_up/logic/sign_up_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/networking/dio_factory.dart';
import '../data/models/sign_up_request_body.dart';
import '../data/repos/sign_up_repo.dart';

class SignUpCubit extends Cubit<SignupState> {
  final SignUpRepo signUpRepo;

  SignUpCubit(this.signUpRepo) : super(const SignupState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitSignUpStates() async {
    emit(const SignupState.signupLoading());
    final response = await signUpRepo.signup(
      SignUpRequestBody(
          username: nameController.text,
          email: emailController.text,
          password: passwordController.text),
    );
    response.when(
        success: (signupResponse) async{
          final prefs = serviceLocator<SharedPreferences>();
          await saveUserToken(signupResponse.jwt);
          await prefs.setString(SharedPreferanceKeys.userEmail  ,signupResponse.user.email);
          await prefs.setString(SharedPreferanceKeys.userInfo  ,signupResponse.user.username);
          emit(SignupState.signupSuccess(signupResponse));
        },
        failure: (error) {
            emit(SignupState.signupError(error: error.apiErrorModel.message ?? 'Please try later!'));
        });
  }


  Future<void> saveUserToken(String token) async {
    final prefs = serviceLocator<SharedPreferences>() ;
    await  prefs.setString(SharedPreferanceKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }

}
