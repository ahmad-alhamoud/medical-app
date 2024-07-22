import '../../widgets/svg_viewer.dart';
import '../config/colors.dart';
import '../constant/images/svg_images.dart';
import 'package:flutter/material.dart';


class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ShowSvg(
    path: SvgImages.logo_icon,
    color: AppColors.mainBlue,
    height: 50,
    );
  }
}
