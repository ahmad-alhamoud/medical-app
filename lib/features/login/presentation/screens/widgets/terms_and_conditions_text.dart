import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:medical_app/core/config/colors.dart';
import 'package:medical_app/core/config/text_style/text_style.dart';
import 'package:medical_app/main.dart';


class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: context.localeString("blogging,youagreetoour"),
            style: FontTextStyle.regular(fontSize: 12, color: AppColors.gray),
          ),
          TextSpan(
            text: context.localeString("termsandConditions"),
            style:FontTextStyle.medium(fontSize: 12, color: AppColors.darkBlue),
          ),
          TextSpan(
            text: context.localeString("and"),
            style: FontTextStyle.medium(fontSize: 12, color: AppColors.darkBlue),
          ),
          TextSpan(
            text:context.localeString("privacypolicy") ,
            style: FontTextStyle.medium(fontSize: 12, color: AppColors.darkBlue),
          ),
        ],
      ),
    );
  }
}