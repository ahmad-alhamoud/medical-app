
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_locales/flutter_locales.dart';
import 'package:medical_app/features/login/presentation/screens/widgets/password_validations.dart';

import '../../../../../core/config/spacing.dart';
import '../../../../../core/global_function/app_regex.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../logic/login_cubit.dart';


class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({Key? key}) : super(key: key);

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;
   bool hasLowerCase = false;
   bool hasUpperCase = false;
   bool hasSpecialCharacters = false;
   bool hasNumber = false;
   bool hasMinLength = false;

   TextEditingController passwordController =  TextEditingController();

  @override
  void initState() {
    super.initState();
  //  passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener() ;
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text) ;
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text) ;
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(passwordController.text) ;
        hasNumber = AppRegex.hasNumber(passwordController.text) ;
        hasMinLength = AppRegex.hasMinLength(passwordController.text) ;
      });
    }) ;
  }

  @override
  void dispose() {
    passwordController.dispose() ;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
       key: context.read<LoginCubit>().formKey,
        child: Column(
          children: [
            AppTextFormField(
               controller: context.read<LoginCubit>().emailController,
              hintText: context.localeString("name"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return  context.localeString("pleastenteravalidname");
                }
              },
            ),
            verticalSpace(18),
            AppTextFormField(
              controller: context.read<LoginCubit>().passwordController,
              hintText: context.localeString("password"),
              isObscureText: isObscureText,

              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                child: Icon(
                    isObscureText ? Icons.visibility_off : Icons.visibility),
              ),
              validator: (value) {
                if (value == null || value.isEmpty ) {
                  return context.localeString("password");
                }
              },
            ),
            verticalSpace(24),
            PasswordValidations(
              hasLowerCase: hasLowerCase,
              hasUpperCase: hasUpperCase,
              hasSpecialCharacters: hasSpecialCharacters,
              hasNumber: hasNumber,
              hasMinLength: hasMinLength,
            ),
          ],
        ));
  }


}
