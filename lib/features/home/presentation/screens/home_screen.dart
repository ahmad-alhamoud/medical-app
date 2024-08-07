import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:medical_app/core/config/colors.dart';
import 'package:medical_app/core/config/spacing.dart';
import 'package:medical_app/core/constant/images/png_images.dart';
import 'package:medical_app/core/di/injection.dart';
import 'package:medical_app/core/global_function/global_prupose_functions.dart';
import 'package:medical_app/core/networking/api_constants.dart';

import 'package:medical_app/core/widgets/home_box.dart';
import 'package:medical_app/core/widgets/no_data_found_screen.dart';
import 'package:medical_app/features/allargie/presentation/screens/allargie_screen.dart';
import 'package:medical_app/features/presecrption/logic/presecrption_cubit.dart';
import 'package:medical_app/features/presecrption/logic/presecrption_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constant/images/svg_images.dart';
import '../../../../widgets/svg_viewer.dart';
import '../../../profile/logic/profile_cubit.dart';
import '../../../profile/logic/profile_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final prefs = serviceLocator<SharedPreferences>();

  @override
  void initState() {
    context.read<ProfileCubit>().emitProfileStates();
    context.read<PresecrptionCubit>().emitPresecrptionState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: BlocBuilder<ProfileCubit, ProfileState>(
        buildWhen: (previous, current) =>
            current is Loading || current is Success || current is Error,
        builder: (context, state) {
          return state.maybeWhen(success: (ProfileResponseBody) {
            DateTime? dataTime = DateTime.tryParse(
                ProfileResponseBody.data.attributes.birthDate.toString());

            String formatedDateStart =
                DateFormat('dd/MM/yyyy').format(dataTime!);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 180.h,
                  decoration: BoxDecoration(
                      color: Color(0xFF363f93).withOpacity(0.7),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40),
                      )),
                  child: Stack(
                    children: [
                      Positioned(
                          top: 40,
                          right: 20,
                          child: IconButton(
                            onPressed: () {
                              if (ZoomDrawer.of(context)!.isOpen()) {
                                ZoomDrawer.of(context)!.close();
                              } else {
                                ZoomDrawer.of(context)!.open();
                              }
                            },
                            icon: Icon(
                              Icons.menu_rounded,
                              color: AppColors.whiteColor,
                              size: 30,
                            ),
                          )),
                      Positioned(
                        top: 80.h,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 35,
                                backgroundImage:  NetworkImage(
                                    ApiConstants.imageBase +
                                        ProfileResponseBody.data.attributes
                                            .profilePic.data.attributes.url ) ,
                              ),
                              horizontalSpace(100),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "${GlobalPruposeFunctions.getUserName()}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.whiteColor),
                                  ),
                                  verticalSpace(10),
                                  Text(
                                    "${GlobalPruposeFunctions.getEmailUser()}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.whiteColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                verticalSpace(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildBox(
                        context,
                        Icons.smoking_rooms_outlined,
                        Colors.redAccent,
                        ProfileResponseBody.data.attributes.smoker.toString()),
                    buildBox(
                        context,
                        Icons.family_restroom_rounded,
                        AppColors.mainBlue,
                        ProfileResponseBody.data.attributes.familyStatus),
                    buildBox(context, Icons.bloodtype, Colors.redAccent,
                        ProfileResponseBody.data.attributes.blodType),
                  ],
                ),
                verticalSpace(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildBox(context, Icons.date_range, Colors.green,
                        formatedDateStart),
                    buildBox(context, Icons.work, Colors.deepPurpleAccent,
                        ProfileResponseBody.data.attributes.job),
                    buildBox(context, Icons.home, Colors.black,
                        ProfileResponseBody.data.attributes.nationality),
                  ],
                ),
                // prescription
                verticalSpace(20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    context.localeString("medicines"),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.gray),
                  ),
                ),
                BlocBuilder<PresecrptionCubit, PresecrptionState>(
                    buildWhen: (previous, current) =>
                        current is Wrong ||
                        current is DataLoading ||
                        current is DataLoaded,
                    builder: (context, state) {
                      return state.maybeWhen(
                          dataLoaded: (PrescriptionResponseBody) {

                        return  PrescriptionResponseBody.data.attributes.prescription.length == 0 ? Padding(
                          padding:  EdgeInsets.all(40.h),
                          child: Center(
                            child: Text(
                                context.localeString("nomediciensfound"),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ) :Flexible(
                          child: ListView.builder(
                            shrinkWrap: true,
                              itemCount: PrescriptionResponseBody
                                  .data.attributes.prescription.length,
                              itemBuilder: (context, i) {
                                DateTime? dataTime = DateTime.tryParse(
                                    PrescriptionResponseBody.data.attributes.prescription[i].medicines.data[0].attributes.createdAt.toString());

                                String formatedDateStart =
                                DateFormat('dd/MM/yyyy').format(dataTime!);
                                return Container(
                                  padding: EdgeInsets.all(20),
                                  height: 70.h,
                                  margin: EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                        offset: Offset(4, 5)
                                      ),
                                    ] ,
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                          "${PrescriptionResponseBody
                                              .data.attributes.prescription[i].medicines.data[0].attributes.name}" ?? ""
                                          ),
                                          verticalSpace(5),
                                          Text(
                                              "${PrescriptionResponseBody
                                                  .data.attributes.prescription[i].medicines.data[0].attributes.description}"??"",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "${formatedDateStart}" ??""
                                      )
                                    ],
                                  ),
                                );
                              }),
                        );
                      }, orElse: () {
                        return  Center(
                          child: Text(
                            context.localeString("nomediciensfound")
                              ),
                        );
                      });
                    }
                    )
              ],
            );
          }, orElse: () {
            return Center(child: NoDataFoundWidget());
          });
        },
      ),
    );
  }

  Widget buildBox(
      BuildContext context, IconData icon, Color color, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 90.h,
      width: 110.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(0),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                offset: Offset(-10, 0),
                blurRadius: 20,
                spreadRadius: 4.0),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
            size: 40,
          ),
          verticalSpace(10),
          Center(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
