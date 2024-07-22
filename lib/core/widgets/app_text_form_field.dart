
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/config/colors.dart';
import 'package:medical_app/core/config/text_style/text_style.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enableBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;

  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextInputAction textInputAction;
  final TextEditingController? controller ;
  final Function(String?)  validator ;
  const AppTextFormField(
      {Key? key,
      this.contentPadding,
      this.focusedBorder,
      this.enableBorder,
      this.inputTextStyle,
      this.hintStyle,
      required this.hintText,
      this.isObscureText,
      this.suffixIcon,
        this.backgroundColor,
        this.controller,
        this.textInputAction = TextInputAction.send,

      required this.validator
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller: controller,
      decoration: InputDecoration(
        fillColor: backgroundColor ?? AppColors.moreLightGray,
        filled: true,
        isDense: true,
        contentPadding: contentPadding ?? EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 18.h,
        ),
        focusedBorder: focusedBorder ?? OutlineInputBorder(
            borderSide:const BorderSide(color: AppColors.mainBlue, width: 1.3),
            borderRadius: BorderRadius.circular(16)),
        enabledBorder: enableBorder ??  OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.lighterGray,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(16)),
        hintStyle: hintStyle ?? FontTextStyle.regular(fontSize: 14, color: AppColors.gray),
        hintText: hintText,
        suffixIcon: suffixIcon,
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(16)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(16)),
      ),
      obscureText: isObscureText ?? false,
      style: inputTextStyle ??  FontTextStyle.medium(fontSize: 14, color: AppColors.gray),
      validator: (value) {
        return validator(value) ;
      },
    );
  }
}
