import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:medical_app/core/config/colors.dart';
import 'package:medical_app/core/config/spacing.dart';
import 'package:medical_app/core/widgets/app_text_button.dart';
import 'package:medical_app/core/widgets/app_text_form_field.dart';
import 'package:medical_app/features/contact_us/logic/contact_us_cubit.dart';
import 'package:medical_app/features/contact_us/presentation/screens/widgets/contact_us_listener.dart';


import '../../../../core/config/text_style/text_style.dart';
import '../../../../core/constant/images/svg_images.dart';
import '../../../../widgets/svg_viewer.dart';


class ContactUsScreen extends StatelessWidget {
   const ContactUsScreen({Key? key}) : super(key: key);

    static const String routeName = '/contact_us' ;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ContactUsCubit>().formKey,
      child: Scaffold(
        resizeToAvoidBottomInset : true,
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
                  controller: context.read<ContactUsCubit>().subjectController,
                    hintText: context.localeString("subject"),
                    validator: (value) {
                      return null ;
                    }
                ),
                verticalSpace(12),
                AppTextFormField(

                  minLines: 1,
                    keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  controller: context.read<ContactUsCubit>().messageController,
                    hintText: context.localeString("message"),
                    validator: (value) {
                      if ( value == null || value.isEmpty) {
                        return context.localeString("validMessage");
                      }
                    }
                ),
                verticalSpace(100),
                AppTextButton(
                    buttonText:  context.localeString("send"),
                    textStyle: FontTextStyle.regular(fontSize: 16, color: AppColors.whiteColor),
                    onPressed: (){
                      doValidationThenSendTheForm(context);
                    }
                ),
                const ContactUsListener()
              ],
            ),
          ),
        ),
      ),
    );
  }

   void doValidationThenSendTheForm(BuildContext context) {
     if (context.read<ContactUsCubit>().formKey.currentState!.validate()) {
       context.read<ContactUsCubit>().emitContactUsStates();
     }
   }

}
