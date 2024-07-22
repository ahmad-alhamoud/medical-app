import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:medical_app/core/constant/shared_preferance/shared_preferance_keys.dart';
import 'package:medical_app/core/di/injection.dart';
import 'package:medical_app/core/global_function/global_prupose_functions.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashEntered>(_mapSplashEntered);
  }

  FutureOr<void> _mapSplashEntered(
  SplashEntered event, Emitter<SplashState> emit) async {

   await Future.delayed( const Duration(seconds: 2)) ;

   final prefs = serviceLocator<SharedPreferences>();
    if (!prefs.containsKey(SharedPreferanceKeys.hasEntered)) {
      emit(OnBoardingNavigationState());
    }
    else if (GlobalPruposeFunctions.getAccessToken() == null) {
        emit(AuthNavigationState()) ;
    }
    else {
    emit(MainNavigationState()) ;
    }
  }


}
