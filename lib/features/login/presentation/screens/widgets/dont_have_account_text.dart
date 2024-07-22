
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';


import '../../../../../core/config/colors.dart';
import '../../../../../core/config/text_style/text_style.dart';
import '../../../../sign_up/presentation/screens/sign_up_screen.dart';



class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: context.localeString("donthavaanaccount"),
            style: FontTextStyle.regular(
                fontSize: 13, color: AppColors.gray),
      ),

          TextSpan(
            text: context.localeString("signup"),
            style: FontTextStyle.regular(
                fontSize: 16, color: AppColors.mainBlue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.of(context).pushReplacementNamed(SignUpScreen.routeName);
              },
          ),
        ],
      ),
    );
  }
}