import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:medical_app/core/config/colors.dart';
import 'package:medical_app/core/config/spacing.dart';
import 'package:medical_app/core/widgets/app_text_button.dart';
import 'package:medical_app/core/widgets/app_text_form_field.dart';


import '../../../../core/config/text_style/text_style.dart';
import '../../../../core/constant/images/svg_images.dart';
import '../../../../widgets/svg_viewer.dart';


class ContactUsScreen extends StatelessWidget {
   const ContactUsScreen({Key? key}) : super(key: key);

    static const String routeName = '/contact_us' ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title:  const ShowSvg(
          path: SvgImages.logoPrimeryColor,
          color: AppColors.mainBlue,
          height: 20,
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                context.localeString("tellus"),
                style: FontTextStyle.regular(
                    fontSize: 20, color: AppColors.darkBlue),
              ),
              verticalSpace(50),
              AppTextFormField(
                  hintText: context.localeString("subject"),
                  validator: (value) {
                    return null;
                  }
              ),
              verticalSpace(12),
              AppTextFormField(
                  hintText: context.localeString("message"),
                  validator: (value) {
                    return null;
                  }
              ),
              verticalSpace(100),
              AppTextButton(
                  buttonText:  context.localeString("send"),
                  textStyle: FontTextStyle.regular(fontSize: 16, color: AppColors.whiteColor),
                  onPressed: (){}
              )
            ],
          ),
        ),
      ),
    );
  }
}
