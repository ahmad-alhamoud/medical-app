
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:medical_app/features/login/presentation/screens/login_screen.dart';
import 'package:medical_app/features/sign_up/presentation/screens/sign_up_screen.dart';
import 'package:medical_app/main.dart';

import '../../../../../core/config/colors.dart';
import '../../../../../core/config/text_style/text_style.dart';


class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: context.localeString("alreadyhavaaccount"),
            style:FontTextStyle.regular(
                fontSize: 13, color: AppColors.darkBlue),
          ),
          TextSpan(
            text: context.localeString("login"),
            style: FontTextStyle.regular(
    fontSize: 16, color: AppColors.mainBlue),

            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
              },
          ),
        ],
      ),
    );
  }
}