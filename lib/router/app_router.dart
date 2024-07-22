import 'package:flutter/material.dart';
import 'package:medical_app/features/login/presentation/screens/login_screen.dart';

import '../features/on_boarding/presentation/screens/on_boarding.dart';
import '../features/sign_up/presentation/screens/sign_up_screen.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) {
          return LoginScreen();
        });
      case SignUpScreen.routeName:
        return MaterialPageRoute(builder: (_) {
          return SignUpScreen();
        });

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
