

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:medical_app/core/networking/api_service.dart';
import 'package:medical_app/core/networking/dio_factory.dart';
import 'package:medical_app/features/login/data/repos/login_repo.dart';
import 'package:medical_app/features/login/logic/login_cubit.dart';
import 'package:medical_app/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:medical_app/features/sign_up/logic/sign_up_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final serviceLocator = GetIt.instance;
final getIt = GetIt.instance;
Future<void> init() async => appDependencies();

Future<void> appDependencies() async {

  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);

  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));


  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));

  getIt.registerLazySingleton<LoginRepo>(()=> LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(()=> LoginCubit(getIt())) ;

}
