import 'package:flutter/material.dart';
import 'package:medical_app/core/config/colors.dart';
import 'package:medical_app/core/config/spacing.dart';
import 'package:medical_app/core/constant/images/png_images.dart';
import 'package:medical_app/features/profile/presentation/screens/widgets/settings_row.dart';
import 'package:medical_app/features/profile/presentation/screens/widgets/title_subtitle_cell.dart';

class ProfileScreen extends StatefulWidget {
   ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

          body: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: Column (
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          PngImages.user1,
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
                              "احمد الحمود",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "ahmad@gmail.com",
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
                  const Row(
                    children: [
                      Expanded(
                        child: TitleSubtitleCell(
                          title: "180cm",
                          subtitle: "الطول",
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: TitleSubtitleCell(
                          title: "65kg",
                          subtitle: "الوزن",
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: TitleSubtitleCell(
                          title: "25",
                          subtitle: "عام",
                        ),
                      ),
                      Divider(),

                    ],
                  ),
                  verticalSpace(15),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.whiteColor,
                    ),

                    height: 40,
                    child: Center(
                      child: SettingRow(
                        icon: PngImages.contactImage,
                        title: "تواصل معنا",
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
