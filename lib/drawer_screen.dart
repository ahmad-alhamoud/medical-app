import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:medical_app/core/config/colors.dart';

import 'package:medical_app/main_screen.dart';
import 'package:medical_app/menu_screen.dart';

class DrawerScreen extends StatefulWidget {
    const DrawerScreen({Key? key}) : super(key: key);

    @override
    State<DrawerScreen> createState() => _DrawerScreenState();
  }

  class _DrawerScreenState extends State<DrawerScreen> {

    final zoomDrawerController = ZoomDrawerController();

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: ZoomDrawer(
          mainScreenOverlayColor: Colors.white,
            borderRadius:  50,
            controller: zoomDrawerController,
            style: DrawerStyle.defaultStyle,
            showShadow: false,
            angle: 0.0,
            menuBackgroundColor: AppColors.mainBlue,
            slideWidth: MediaQuery.of(context).size.width * .8,
            mainScreenScale: 0.2,
            mainScreenTapClose: true,
            mainScreenAbsorbPointer: true,
            menuScreen: MenuScreen(),
            mainScreen: MainScreen()
        ),
      );
    }
  }
