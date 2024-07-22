import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:medical_app/core/config/colors.dart';
import 'package:medical_app/core/config/spacing.dart';
import 'package:medical_app/core/constant/local/locales.dart';
import 'package:medical_app/core/constant/shared_preferance/shared_preferance_keys.dart';
import 'package:medical_app/core/di/injection.dart';
import 'package:medical_app/core/widgets/app_text_button.dart';
import 'package:medical_app/features/login/presentation/screens/login_screen.dart';
import 'package:medical_app/features/on_boarding/data/entities/onboarding_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/config/text_style/text_style.dart';
import '../../../../core/constant/images/png_images.dart';

class OnBoardingScreen extends StatefulWidget {
  final bool fromSetting;

  OnBoardingScreen({Key? key, this.fromSetting = false}) : super(key: key);

  static const String routeName = '/intro';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final pageController = PageController();

  bool isLastPage = false;
  int selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    List<OnboardingInfo> OnboardingItems = [
      OnboardingInfo(
          title: context.localeString("onboarding1"),
          image: PngImages.onboarding1),
      OnboardingInfo(
          title: context.localeString("onboarding2"),
          image: PngImages.onboarding2),
      OnboardingInfo(
          title: context.localeString("onboarding3"),
          image: PngImages.onboarding3),
    ];
    final controller = OnboardingItems.length;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Locales.change(context, LocalesCODE.ENLOCALCODE);
              },
              child: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                child: Image.asset(
                  PngImages.enLogo,
                  height: 26,
                  width: 26,
                ),
              ),
            ),
            horizontalSpace(20),
            InkWell(
              onTap: () {
                Locales.change(context, LocalesCODE.ARLOCALCODE);
              },
              child: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                child: Image.asset(
                  PngImages.arLogo,
                  height: 26,
                  width: 26,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: PageView.builder(
            onPageChanged: (page) {
              setState(() {
                selectedValue = page;
              });
            },
            itemCount: OnboardingItems.length,
            controller: pageController,
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    verticalSpace(120),
                    Image.asset(
                      OnboardingItems[index].image,
                      fit: BoxFit.cover,
                    ),
                    verticalSpace(15),
                    Text(
                      OnboardingItems[index].title,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    verticalSpace(70),
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: selectedValue == OnboardingItems.length - 1
                          ? AppTextButton(
                              buttonText: context.localeString("login"),
                              textStyle: FontTextStyle.regular(
                                  fontSize: 16, color: AppColors.whiteColor),
                              onPressed: () async{
                               final prefs =   serviceLocator<SharedPreferences>();
                                prefs.setBool(SharedPreferanceKeys.hasEntered, true);
                                Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                              })
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //Skip Button
                                TextButton(
                                    onPressed: () => pageController
                                        .jumpToPage(OnboardingItems.length - 1),
                                    child: Text(
                                      context.localeString("skip"),
                                      style: FontTextStyle.regular(
                                          fontSize: 16,
                                          color: AppColors.mainBlue),
                                    )),

                                //Indicator
                                SmoothPageIndicator(
                                  controller: pageController,
                                  count: controller,
                                  onDotClicked: (index) =>
                                      pageController.animateToPage(index,
                                          duration:
                                              const Duration(milliseconds: 600),
                                          curve: Curves.easeIn),
                                  effect: const WormEffect(
                                    dotHeight: 12,
                                    dotWidth: 12,
                                    activeDotColor: AppColors.mainBlue,
                                  ),
                                ),

                                //Next Button
                                TextButton(
                                    onPressed: () => pageController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 600),
                                        curve: Curves.easeIn),
                                    child: Text(context.localeString("next"),
                                        style: FontTextStyle.regular(
                                            fontSize: 16,
                                            color: AppColors.mainBlue))),
                              ],
                            ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
