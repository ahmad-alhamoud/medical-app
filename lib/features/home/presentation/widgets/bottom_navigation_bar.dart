import 'package:flutter/material.dart';
import 'package:medical_app/core/config/colors.dart';


import '../../../../core/constant/images/svg_images.dart';

import 'bottom_navigation_bar_icons.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex ;
  const BottomNavigationBarWidget({
     this.currentIndex = 0 ,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 24,
        left: 24,
        bottom: 24,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(120),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 70,
          color: AppColors.mainBlue,
          child: Padding(
            padding: EdgeInsets.only(left: 12, right: 12),
            child: Row(
              children: [
                BottomNavigationBarIcons(
                  imagePath: SvgImages.home,
                  isClicked: currentIndex == 0,
                  clickFunction: () {

                  },
                ),
                BottomNavigationBarIcons(
                  imagePath: SvgImages.logo_icon,
                  isClicked: currentIndex == 1,
                  clickFunction: () {

                  },
                ),
                BottomNavigationBarIcons(
                  imagePath: SvgImages.logo_icon,
                  isClicked: currentIndex == 2,
                  clickFunction: () {

                  },
                ),
                BottomNavigationBarIcons(
                  imagePath: SvgImages.logo_icon,
                  isClicked: currentIndex == 3,
                  clickFunction: () {

                  },
                ),
                BottomNavigationBarIcons(
                  imagePath: SvgImages.user,
                  isClicked: currentIndex == 4,
                  clickFunction: () {

                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
