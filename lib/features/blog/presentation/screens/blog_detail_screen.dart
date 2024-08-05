import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/config/text_style/text_style.dart';
import 'package:medical_app/core/networking/api_constants.dart';

import '../../../../core/config/colors.dart';
import '../../../../core/config/spacing.dart';
import '../../../../core/constant/images/png_images.dart';
import '../../../../core/constant/images/svg_images.dart';
import '../../../../widgets/svg_viewer.dart';
import '../../data/models/blog_response_body.dart';

class BlogDetailScreen extends StatelessWidget {

  final BlogResponseData blogResponseData;
  const BlogDetailScreen({Key? key , required this.blogResponseData}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(

      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: blogResponseData.id.toString(),
                  child: Image.network(
                    ApiConstants.imageBase+blogResponseData.attributes!.mainImage!.data![0].attributes!.url.toString(),
                    height: 400.h,
                    width: size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 40.h, bottom: 0, left: 24.w, right: 24.w),
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
                              color: AppColors.darkBlue,
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
                         blogResponseData.attributes!.title.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
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
                    mainAxisAlignment:
                    MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.whiteColor,
                        child: Image.asset(
                          PngImages.doctorImage,
                          height: 30.h,
                          width: 40.w,
                        ),
                      ),
                      horizontalSpace(10),
                      Text(
                        context
                            .localeString("ministryofhealth"),
                        style: FontTextStyle.medium(
                            fontSize: 17,
                            color: AppColors.darkBlue),
                      )
                    ],
                  ),
                  Divider(
                    thickness: 1.0,
                    color: AppColors.darkBlue.withOpacity(0.08),
                    height: 12,
                  ),

                ],
              ),
            ),
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                    shrinkWrap: true,
                  itemCount: blogResponseData.attributes!.paragraph!.length ?? 0,
                  itemBuilder: (context , index ) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                              blogResponseData.attributes!.paragraph![index].content.toString()
                          ),
                          Divider(
                            thickness: 1.0,
                            color: AppColors.darkBlue.withOpacity(0.08),
                            height: 32,
                          ),
                        ],
                      ),
                    );
                  }
              ),
            ),

          ],
        ),
      ),
    );
  }
}
