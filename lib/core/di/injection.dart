

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:medical_app/core/networking/api_service.dart';
import 'package:medical_app/core/networking/dio_factory.dart';
import 'package:medical_app/features/allargie/data/repos/allargie_repo.dart';
import 'package:medical_app/features/allargie/logic/allargie_cubit.dart';
import 'package:medical_app/features/blog/data/repos/blog_repo.dart';
import 'package:medical_app/features/blog/logic/blog_cubit.dart';
import 'package:medical_app/features/contact_us/data/repos/contact_us_repo.dart';
import 'package:medical_app/features/contact_us/logic/contact_us_cubit.dart';
import 'package:medical_app/features/disease/data/repos/diseases_repo.dart';
import 'package:medical_app/features/disease/logic/diseases_cubit.dart';
import 'package:medical_app/features/login/data/repos/login_repo.dart';
import 'package:medical_app/features/login/logic/login_cubit.dart';
import 'package:medical_app/features/presecrption/data/repos/presecrption_repo.dart';
import 'package:medical_app/features/presecrption/logic/presecrption_cubit.dart';
import 'package:medical_app/features/profile/data/repos/profile_repo.dart';
import 'package:medical_app/features/profile/logic/profile_cubit.dart';
import 'package:medical_app/features/session/data/repos/session_repo.dart';
import 'package:medical_app/features/session/logic/session_cubit.dart';
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

  getIt.registerLazySingleton<ContactUsRepo>(()=> ContactUsRepo(getIt()));
  getIt.registerFactory<ContactUsCubit>(()=> ContactUsCubit(getIt()));

  getIt.registerLazySingleton<BlogRepo>(()=> BlogRepo(getIt()));
  getIt.registerFactory<BlogCubit>(()=> BlogCubit(getIt()));

  getIt.registerLazySingleton<SessionRepo>(()=>SessionRepo(getIt()));
  getIt.registerFactory<SessionCubit>(()=> SessionCubit(getIt()));

  getIt.registerLazySingleton<DiseasesRepo>(()=>DiseasesRepo(getIt()));
  getIt.registerFactory<DiseasesCubit>(()=> DiseasesCubit(getIt()));


  getIt.registerLazySingleton<AllargieRepo>(()=>AllargieRepo(getIt()));
  getIt.registerFactory<AllargieCubit>(()=> AllargieCubit(getIt()));


  getIt.registerLazySingleton<ProfileRepo>(()=>ProfileRepo(getIt()));
  getIt.registerFactory<ProfileCubit>(()=> ProfileCubit(getIt()));

  getIt.registerLazySingleton<PresecrptionRepo>(()=>PresecrptionRepo(getIt()));
  getIt.registerFactory<PresecrptionCubit>(()=> PresecrptionCubit(getIt()));

}
