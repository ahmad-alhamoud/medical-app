import 'package:flutter/material.dart';
import 'package:medical_app/core/config/colors.dart';

import '../../../../widgets/svg_viewer.dart';




class BottomNavigationBarIcons extends StatelessWidget {
  final bool isClicked;
  final String imagePath;
  final Function clickFunction;
  const BottomNavigationBarIcons({
    required this.isClicked,
    required this.imagePath,
    required this.clickFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => clickFunction(),
        child: CircleAvatar(
          child: ShowSvg(
            path: imagePath,
            color: isClicked ? AppColors.whiteColor : AppColors.natural.shade50,
          ),
          backgroundColor: isClicked ? Colors.black26.withOpacity(0.2) : Colors.transparent,
        ),
      ),
    );
  }
}
