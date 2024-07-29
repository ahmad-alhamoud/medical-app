import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/features/complete_profile/presentation/screens/complete_profile_screen.dart';
import 'package:medical_app/features/contact_us/logic/contact_us_cubit.dart';
import 'package:medical_app/features/contact_us/presentation/screens/contact_us_screen.dart';
import 'package:medical_app/features/login/logic/login_cubit.dart';
import 'package:medical_app/features/login/presentation/screens/login_screen.dart';

import '../core/di/injection.dart';
import '../drawer_screen.dart';
import '../features/on_boarding/presentation/screens/on_boarding.dart';
import '../features/sign_up/logic/sign_up_cubit.dart';
import '../features/sign_up/presentation/screens/sign_up_screen.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) {
          return BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          );
        });
      case SignUpScreen.routeName:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => getIt<SignUpCubit>(),
                child: const SignUpScreen(),
              ),
        );
      case ContactUsScreen.routeName:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => getIt<ContactUsCubit>(),
                child: const ContactUsScreen(),
              ),
        );

      case CompleteProfileScreen.routeName:
        return MaterialPageRoute(builder: (_) => CompleteProfileScreen());


      case DrawerScreen.routeName:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => getIt<ContactUsCubit>(),
              child: DrawerScreen(),
            ));

      case OnBoardingScreen.routeName:
        return MaterialPageRoute(
          builder: (_) {
            return OnBoardingScreen(
              fromSetting: routeSettings.arguments as bool,
            );
          },
        );
    }
    return null;
  }
}
