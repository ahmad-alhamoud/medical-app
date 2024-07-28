import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/config/colors.dart';

import 'package:medical_app/core/constant/images/png_images.dart';


import 'blog_detail_screen.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
      return Scaffold(
        backgroundColor: AppColors.whiteColor,
         body: Center(
           child: Hero(
             tag: "blogImage",
             child: GestureDetector(
               onTap: (){
                 Navigator.of(context).push(MaterialPageRoute(builder: (_) => BlogDetailScreen()));
               },
               child: Container(
                 height: 252.h,
                 width: size.width,
                 decoration: BoxDecoration(
                   color: AppColors.whiteColor,
                   borderRadius: BorderRadius.circular(24),
                     image: DecorationImage(
                       image: AssetImage(
                         PngImages.onboarding1,
                       ),
                       fit: BoxFit.cover
                     )
                 ),
               ),
             ),
           ),
         ),
      );
  }
}
