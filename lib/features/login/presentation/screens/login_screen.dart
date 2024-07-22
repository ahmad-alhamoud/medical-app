import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/config/colors.dart';
import 'package:medical_app/core/config/text_style/text_style.dart';
import 'package:medical_app/core/widgets/app_logo.dart';
import 'package:medical_app/features/login/presentation/screens/widgets/dont_have_account_text.dart';
import 'package:medical_app/features/login/presentation/screens/widgets/email_and_password.dart';
import 'package:medical_app/features/login/presentation/screens/widgets/terms_and_conditions_text.dart';

import '../../../../core/config/spacing.dart';
import '../../../../core/constant/images/svg_images.dart';
import '../../../../core/widgets/app_text_button.dart';

import '../../../../home_dev.dart';
import '../../../../widgets/svg_viewer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const AppLogo(),
                Text(
                  context.localeString("welcome"),
                  style: FontTextStyle.regular(
                      fontSize: 30, color: AppColors.primeryColor),
                ),
                verticalSpace(8),
                Text(
                  context.localeString("logint"),
                  style: FontTextStyle.regular(
                      fontSize: 15, color: AppColors.gray),
                ),
                verticalSpace(36),
                Column(
                  children: [
                    const EmailAndPassword(),
                    verticalSpace(24),
                    Text(
                      context.localeString("forgotpassword"),
                      style: FontTextStyle.regular(
                          fontSize: 13, color: AppColors.mainBlue),
                    ),
                    verticalSpace(30),
                    AppTextButton(
                      buttonText: context.localeString("login"),
                      textStyle: FontTextStyle.regular(
                          fontSize: 16, color: AppColors.whiteColor),
                      onPressed: () {
                        //      validateThenDoLogin(context);
                      },
                    ),
                    verticalSpace(16),
                    const TermsAndConditionsText(),
                    verticalSpace(30),
                     const DontHaveAccountText(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// void validateThenDoLogin(BuildContext context) {
//   if (context.read<LoginCubit>().formKey.currentState!.validate()) {
//     context.read<LoginCubit>().emitLoginStates();
//   }
// }
}
