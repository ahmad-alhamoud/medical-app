import 'package:flutter/material.dart';
import 'package:medical_app/core/config/colors.dart';
import 'package:medical_app/core/config/spacing.dart';
import 'package:medical_app/core/constant/images/png_images.dart';
import 'package:medical_app/core/constant/shared_preferance/shared_preferance_keys.dart';
import 'package:medical_app/core/di/injection.dart';
import 'package:medical_app/features/profile/presentation/screens/widgets/settings_row.dart';
import 'package:medical_app/features/profile/presentation/screens/widgets/title_subtitle_cell.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
   ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {



  @override
  Widget build(BuildContext context) {
    final prefs = serviceLocator<SharedPreferences>();
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
                              prefs.getString(SharedPreferanceKeys.userInfo)!,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              prefs.getString(SharedPreferanceKeys.userEmail)!,
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
                          title:  prefs.getString(SharedPreferanceKeys.hight)!,
                          subtitle: "الطول",
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: TitleSubtitleCell(
                          title: prefs.getString(SharedPreferanceKeys.weight)!,
                          subtitle: "الوزن",
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: TitleSubtitleCell(
                          title: prefs.getString(SharedPreferanceKeys.age)!,
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
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
