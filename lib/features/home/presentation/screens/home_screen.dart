import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:medical_app/core/config/colors.dart';
import 'package:medical_app/core/config/spacing.dart';
import 'package:medical_app/core/config/text_style/text_style.dart';

import '../../../../core/constant/images/svg_images.dart';
import '../../../../widgets/svg_viewer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        leading: IconButton(
          onPressed: () {
            if (ZoomDrawer.of(context)!.isOpen()) {
              ZoomDrawer.of(context)!.close();
            } else {
              ZoomDrawer.of(context)!.open();
            }
          },
          icon: Icon(Icons.menu_rounded),
        ),
        title: const ShowSvg(
          path: SvgImages.logoPrimeryColor,
          color: AppColors.mainBlue,
          height: 20,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          child: Column(
            children: [
              Container(
                height: 200.h,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        patientDetail(),
                        VerticalDivider(
                          color: AppColors.gray,
                          thickness: 1.3,
                        ),
                        patientDetail(),
                      ],
                    ),
                    Divider(
                      color: AppColors.gray,
                      thickness: 1.3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        patientDetail(),
                        VerticalDivider(
                          color: AppColors.gray,
                          thickness: 1.3,
                        ),
                            patientDetail(),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget patientDetail() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            CircleAvatar(
              backgroundColor: AppColors.whiteColor,
              child: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
            Text(
              "السن",
              style: FontTextStyle.regular(
                  fontSize: 16, color: AppColors.darkBlue),
            ),
            horizontalSpace(20),
          ],
        ),
        Row(
          children: [Text("24"), Text("years old")],
        )
      ],
    );
  }
}
