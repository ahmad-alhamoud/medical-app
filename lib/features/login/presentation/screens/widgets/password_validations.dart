import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:medical_app/core/config/text_style/text_style.dart';
import 'package:medical_app/main.dart';

import '../../../../../core/config/colors.dart';
import '../../../../../core/config/spacing.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;

  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow(
            context.localeString("atleastonelowerlatter"), hasLowerCase),
        verticalSpace(2),
        buildValidationRow(
            context.localeString("atleastoneupperlatter"), hasUpperCase),
        verticalSpace(2),
        buildValidationRow(context.localeString("atleastonespecialcharacter"),
            hasSpecialCharacters),
        verticalSpace(2),
        buildValidationRow(context.localeString("atleastonenumber"), hasNumber),
        verticalSpace(2),
        buildValidationRow(
            context.localeString("atleastlongcharcters"), hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: AppColors.gray,
        ),
        horizontalSpace(6),
        Text(
          text,
          style: FontTextStyle.regular(fontSize: 13, color: AppColors.gray).copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidated ? AppColors.gray : AppColors.darkBlue,
          ),
        )
      ],
    );
  }
}
