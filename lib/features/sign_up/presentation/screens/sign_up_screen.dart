import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/config/colors.dart';
import 'package:medical_app/features/sign_up/presentation/screens/widgets/already_have_account_text.dart';
import 'package:medical_app/features/sign_up/presentation/screens/widgets/sign_up_form.dart';
import 'package:medical_app/main.dart';

import '../../../../core/config/spacing.dart';
import '../../../../core/config/text_style/text_style.dart';
import '../../../../core/widgets/app_logo.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../login/presentation/screens/widgets/terms_and_conditions_text.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const String routeName = '/sign_up';

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
                  context.localeString("createaccount"),
              //    TextStyles.font24BlueBold
                  style: FontTextStyle.regular(fontSize: 24, color: AppColors.mainBlue),
                ),
                verticalSpace(8),
                Text(
                  context.localeString("signupt"),
                  style: FontTextStyle.regular(fontSize: 14, color: AppColors.gray),
                ),
                verticalSpace(36),
                Column(
                  children: [
                   const SignupForm(),
                    verticalSpace(40),
                    AppTextButton(
                      buttonText: context.localeString("createaccount"),
                      textStyle: FontTextStyle.regular(
                          fontSize: 16, color: AppColors.whiteColor),
                      onPressed: () {
                     //   validateThenDoSignup(context);
                      },
                    ),
                    verticalSpace(16),
                    const TermsAndConditionsText(),
                    verticalSpace(30),
                    const AlreadyHaveAccountText(),
                    // const SignupBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void validateThenDoSignup(BuildContext context) {
  //   if (context.read<SignupCubit>().formKey.currentState!.validate()) {
  //     context.read<SignupCubit>().emitSignupStates();
  //   }
  // }
}