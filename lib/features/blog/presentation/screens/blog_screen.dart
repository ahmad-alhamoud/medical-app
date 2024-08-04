import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/config/colors.dart';
import 'package:medical_app/core/config/spacing.dart';
import 'package:medical_app/core/config/text_style/text_style.dart';

import 'package:medical_app/core/constant/images/png_images.dart';
import 'package:medical_app/core/networking/api_constants.dart';
import 'package:medical_app/features/blog/data/models/blog_response_body.dart';
import 'package:medical_app/features/blog/logic/blog_cubit.dart';

import 'package:medical_app/features/blog/logic/blog_state.dart';
import 'package:medical_app/features/blog/presentation/screens/blog_detail_screen.dart';

import '../../../../core/constant/images/svg_images.dart';
import '../../../../widgets/svg_viewer.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  @override
  void initState() {
    context.read<BlogCubit>().emitBlogState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          title: ShowSvg(
            path: SvgImages.logoPrimeryColor,
            color: AppColors.mainBlue,
            height: 20,
          ),
          centerTitle: true,
        ),
        backgroundColor: AppColors.whiteColor,
        body: BlocBuilder<BlogCubit, BlogState>(
          buildWhen: (previous, current) =>
              current is Loading || current is Success || current is Error,
          builder: (context, state) {
            return state.maybeWhen(success: (BlogResponseBody) {
              List<BlogResponseData> data = BlogResponseBody.data;

              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      children: [
                        verticalSpace(10),
                        Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return BlogDetailScreen(
                                      blogResponseData: data[index]);
                                }));
                              },
                              child: Hero(
                                tag: data[index].id.toString(),
                                child: Container(
                                  height: 252.h,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                    color: AppColors.lighterGray,
                                    borderRadius: BorderRadius.circular(24),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          ApiConstants.imageBase +
                                              data[index]
                                                  .attributes!
                                                  .mainImage!
                                                  .data![0]
                                                  .attributes!
                                                  .url
                                                  .toString(),
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 16.h, horizontal: 24.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data[index].attributes!.title.toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: FontTextStyle.regular(
                                          fontSize: 20,
                                          color: AppColors.whiteColor),
                                    ),
                                    verticalSpace(10),
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
                                              color: AppColors.whiteColor),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            }, orElse: () {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.mainBlue,
                ),
              );
            });
          },
        ),
      ),
    );
  }
}
