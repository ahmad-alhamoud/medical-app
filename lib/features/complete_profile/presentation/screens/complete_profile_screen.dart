import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/config/colors.dart';
import 'package:medical_app/core/config/spacing.dart';
import 'package:medical_app/core/config/text_style/text_style.dart';
import 'package:medical_app/core/constant/images/png_images.dart';
import 'package:medical_app/core/constant/shared_preferance/shared_preferance_keys.dart';
import 'package:medical_app/core/di/injection.dart';
import 'package:medical_app/core/widgets/app_text_button.dart';
import 'package:medical_app/core/widgets/app_text_form_field.dart';
import 'package:medical_app/drawer_screen.dart';
import 'package:medical_app/features/login/presentation/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompleteProfileScreen extends StatefulWidget {
   CompleteProfileScreen({Key? key}) : super(key: key);

  static const  String routeName = '/complete_profile';

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}



class _CompleteProfileScreenState extends State<CompleteProfileScreen> {

  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();


  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SafeArea(
      child: Form(
        key: formKey,
        child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(15).h.w,
              child: Column(
                children: [
                  Image.asset(
                    PngImages.onboarding1,
                    fit: BoxFit.cover,
                    width: media.width,
                  ),
                  verticalSpace(10),
                  Text(
                    context.localeString("completeyourprofile"),
                    style: FontTextStyle.regular(
                        fontSize: 20, color: AppColors.darkBlue),
                  ),
                  verticalSpace(15),
                  Text(
                    context.localeString("itwillhelpusknowmoreaboutyou"),
                    style: FontTextStyle.regular(
                        fontSize: 12, color: AppColors.gray),
                    //style: TextStyle(color: TColor.gray, fontSize: 12),
                  ),
                  verticalSpace(10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      children: [
                        AppTextFormField(
                          keyboardType: TextInputType.number,
                          controller: ageController,
                          suffixIcon: Image.asset(
                            color: AppColors.mainBlue,
                            PngImages.dateImg,
                            scale: 1.3,
                          ),
                          hintText: context.localeString("age"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return context.localeString("age");
                            }
                          },
                        ),
                        verticalSpace(10),
                        AppTextFormField(
                          controller: heightController,
                          keyboardType: TextInputType.number,
                          suffixIcon: Image.asset(
                            color: AppColors.mainBlue,
                            PngImages.hightImg,
                            scale: 1.3,
                          ),
                          hintText: context.localeString("hight"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return context.localeString("hight");
                            }
                          },
                        ),
                        verticalSpace(10),
                        AppTextFormField(
                          controller: weightController,
                          keyboardType: TextInputType.number,
                          suffixIcon: Image.asset(
                            PngImages.weightImg,
                            color: AppColors.mainBlue,
                            scale: 1.3,
                          ),
                          hintText: context.localeString("weight"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return context.localeString("weight");
                            }
                          },
                        ),
                        verticalSpace(40),
                        AppTextButton(
                            buttonText:  context.localeString("save"),
                            textStyle: FontTextStyle.regular(fontSize: 16, color: AppColors.whiteColor),
                            onPressed: (){
                              // Do validation and then cache the data localy and go home
                              DoValidationAndThenGoMain();
                            }
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void DoValidationAndThenGoMain() {
    if (formKey.currentState!.validate()) {
      final prefs = serviceLocator<SharedPreferences>() ;
      prefs.setString(SharedPreferanceKeys.age,ageController.text);
      prefs.setString(SharedPreferanceKeys.hight,heightController.text);
      prefs.setString(SharedPreferanceKeys.weight,weightController.text);

      Navigator.of(context).pushReplacementNamed(DrawerScreen.routeName);
    }
  }


}
