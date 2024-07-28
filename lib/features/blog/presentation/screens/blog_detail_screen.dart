import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/config/text_style/text_style.dart';

import '../../../../core/config/colors.dart';
import '../../../../core/constant/images/png_images.dart';
import '../../../../core/constant/images/svg_images.dart';
import '../../../../widgets/svg_viewer.dart';

class BlogDetailScreen extends StatelessWidget {
  const BlogDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Hero(
                    tag: "blogImage",
                    child: Image.asset(
                      PngImages.onboarding1,
                      height: 400.h,
                      width: size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 64.h, bottom: 0, left: 24.w, right: 24.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.darkBlue.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(48)),
                              padding: EdgeInsets.all(12),
                              height: 40,
                              width: 40,
                              child: ShowSvg(
                                path: SvgImages.arrow_back,
                                width: 40,
                                height: 40,
                              )),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: AppColors.darkBlue.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(48)),
                            padding: EdgeInsets.all(12),
                            height: 40,
                            width: 40,
                            child: ShowSvg(
                              path: SvgImages.bookmark,
                              width: 40,
                              height: 40,
                            ))
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: size.width / 2,
                          child: Text(
                            "عنوان البلوغ",
                            style: FontTextStyle.regular(
                                fontSize: 24, color: AppColors.darkBlue),
                          ),
                        )
                      ],
                    ),
                    Divider(
                      thickness: 1.0,
                      color: AppColors.darkBlue.withOpacity(0.08),
                      height: 32,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.darkBlue.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(48)),
                          padding: EdgeInsets.all(12),
                          height: 40,
                          width: 40,
                          child: ShowSvg(
                            path: SvgImages.user,
                            width: 40,
                            height: 40,
                          ),
                        ),
                        Text("2020-11-4")
                      ],
                    ),
                    Divider(
                      thickness: 1.0,
                      color: AppColors.darkBlue.withOpacity(0.08),
                      height: 32,
                    ),
                    Text(
                        "هذا البرنامج هو تطبيق ويب مجاني وحديث مرادف لبرنامج الرسام القديم يحول الحروف العربية إلى حروف ممكن إستخدامها في البرامج الغير معربة كأدوب فوتوشوب وغيرها."
                        "هذا البرنامج هو تطبيق ويب مجاني وحديث مرادف لبرنامج الرسام القديم يحول الحروف العربية إلى حروف ممكن إستخدامها في البرامج الغير معربة كأدوب فوتوشوب وغيرها."
                        "هذا البرنامج هو تطبيق ويب مجاني وحديث مرادف لبرنامج الرسام القديم يحول الحروف العربية إلى حروف ممكن إستخدامها في البرامج الغير معربة كأدوب فوتوشوب وغيرها."
                        "هذا البرنامج هو تطبيق ويب مجاني وحديث مرادف لبرنامج الرسام القديم يحول الحروف العربية إلى حروف ممكن إستخدامها في البرامج الغير معربة كأدوب فوتوشوب وغيرها."
                        "هذا البرنامج هو تطبيق ويب مجاني وحديث مرادف لبرنامج الرسام القديم يحول الحروف العربية إلى حروف ممكن إستخدامها في البرامج الغير معربة كأدوب فوتوشوب وغيرها.")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
