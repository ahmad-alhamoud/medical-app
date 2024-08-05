import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:medical_app/core/config/colors.dart';
import 'package:medical_app/core/constant/images/png_images.dart';

import 'package:medical_app/core/widgets/home_box.dart';

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

    );
  }
}
