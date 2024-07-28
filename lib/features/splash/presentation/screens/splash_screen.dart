import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/config/colors.dart';
import 'package:medical_app/drawer_screen.dart';
import 'package:medical_app/features/complete_profile/presentation/screens/complete_profile_screen.dart';
import 'package:medical_app/features/login/presentation/screens/login_screen.dart';

import 'package:medical_app/features/splash/presentation/blocs/splash_bloc.dart';

import '../../../../core/constant/images/svg_images.dart';
import '../../../../widgets/svg_viewer.dart';
import '../../../on_boarding/presentation/screens/on_boarding.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      SplashBloc()
        ..add(SplashEntered()),
      child: BlocListener<SplashBloc, SplashState>(
          listener: (context, state) {
            if (state is AuthNavigationState) {
              Navigator.pushReplacementNamed(context, LoginScreen.routeName);
            }
            else if ( state is CompleteProfileState) {
              Navigator.of(context).pushReplacementNamed(CompleteProfileScreen.routeName);
            }
            else if (state is MainNavigationState) {
              Navigator.of(context).pushReplacementNamed(DrawerScreen.routeName);
            } else if (state is OnBoardingNavigationState) {
              Navigator.pushReplacementNamed(
                  context, OnBoardingScreen.routeName,
                  arguments: false
              );
            }
          },
          child: Scaffold(
              body: Container(
                width: double.infinity,
                height: double.infinity,
                color: AppColors.primeryColor.withOpacity(0.7),
                child: Column(
                  children: [
                    const Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ShowSvg(
                          path: SvgImages.logoPrimeryColor,
                          color: AppColors.whiteColor,
                          height: 50,
                        ),
                      ],
                    ),
                    const Spacer(flex: 3),
                  ],
                ),
              )
          )

      ),);
  }
}
