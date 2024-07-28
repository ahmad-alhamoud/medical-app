
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/drawer_screen.dart';


import '../../../../../core/config/colors.dart';
import '../../../../../core/config/text_style/text_style.dart';
import '../../../logic/login_cubit.dart';
import '../../../logic/login_state.dart';



class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
      current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: AppColors.mainBlue,
                ),
              ),
            );
          },
          success: (loginResponse) {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed(DrawerScreen.routeName);
          },
          error: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    Navigator.of(context).pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: FontTextStyle.regular(fontSize: 15, color: AppColors.darkBlue),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Got it',
              style:  FontTextStyle.regular(fontSize: 14, color: AppColors.darkBlue),
            ),
          ),
        ],
      ),
    );
  }
}