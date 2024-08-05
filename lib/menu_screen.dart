import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:medical_app/core/config/colors.dart';
import 'package:medical_app/core/di/injection.dart';
import 'package:medical_app/features/blog/presentation/screens/blog_detail_screen.dart';
import 'package:medical_app/features/contact_us/presentation/screens/contact_us_screen.dart';
import 'package:medical_app/features/profile/data/models/profile_response_body.dart';
import 'package:medical_app/features/profile/logic/profile_cubit.dart';
import 'package:medical_app/features/profile/logic/profile_state.dart';
import 'package:medical_app/features/profile/presentation/screens/widgets/personal_doc_screen.dart';

import 'core/config/spacing.dart';
import 'core/constant/images/png_images.dart';
import 'core/global_function/global_prupose_functions.dart';
import 'core/networking/api_constants.dart';
import 'features/profile/presentation/screens/widgets/settings_row.dart';
import 'features/profile/presentation/screens/widgets/title_subtitle_cell.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    context.read<ProfileCubit>().emitProfileStates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ProfileCubit, ProfileState>(
        buildWhen: (previous, current) =>
            current is Loading || current is Success || current is Error,
        builder: (context, state) {
          return state.maybeWhen(success: (ProfileResponseBody) {
            return Scaffold(
                backgroundColor: AppColors.whiteColor.withOpacity(0.3),
                body: SingleChildScrollView(
                  child: Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(
                        vertical: 45, horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.network(
                                ApiConstants.imageBase +
                                    ProfileResponseBody.data.attributes
                                        .profilePic.data.attributes.url,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${GlobalPruposeFunctions.getUserName()}" ??
                                        "",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '${GlobalPruposeFunctions.getEmailUser()}' ??
                                        "",
                                    style: TextStyle(
                                      color: AppColors.gray,
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(15),
                        Row(
                          children: [
                            Expanded(
                              child: TitleSubtitleCell(
                                title:
                                    "${GlobalPruposeFunctions.getUserHeight()}cm" ??
                                        "200cm",
                                subtitle: "الطول",
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: TitleSubtitleCell(
                                title:
                                    "${GlobalPruposeFunctions.getUserWeight()}kg",
                                subtitle: "الوزن",
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: TitleSubtitleCell(
                                title:
                                    "${GlobalPruposeFunctions.getUserAge()}" ??
                                        "25",
                                subtitle: "عام",
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(15),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.whiteColor,
                          ),
                          height: 50,
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(ContactUsScreen.routeName);
                              },
                              child: const SettingRow(
                                icon: PngImages.contactImage,
                                title: "تواصل معنا",
                              ),
                            ),
                          ),
                        ),
                        verticalSpace(15),
                        // personal Document
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.whiteColor,
                          ),
                          height: 50,
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                // go to personal Document Screen and show the image
                                if (ProfileResponseBody.data.attributes.idFile
                                        .data.attributes.url !=
                                    null) {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (_) {
                                    return PersonalDocScreen(
                                        url: ProfileResponseBody.data.attributes
                                            .idFile.data.attributes.url);
                                  }));
                                }
                              },
                              child: SettingRow(
                                icon: PngImages.privacyImage,
                                title: context.localeString("personaldoc"),
                              ),
                            ),
                          ),
                        ),
                        verticalSpace(40),
                        // Container(
                        //   padding: EdgeInsets.all(10),
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(12),
                        //     color: Colors.red.withOpacity(0.5),
                        //   ),
                        //
                        //   child: Text(
                        //       "جميع البيانات محفوظة بأمان لدى وزراة الصحة شكرا لثقتك...",
                        //   style: TextStyle(
                        //     fontSize: 16,
                        //     color: Colors.black
                        //   ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ));
          }, orElse: () {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.mainBlue,
              ),
            );
          });
        },
      ),
    );
  }
}
