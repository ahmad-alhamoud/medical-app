import 'dart:convert';
// import 'package:share_plus/share_plus.dart';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/shared_preferance/shared_preferance_keys.dart';
import '../di/injection.dart';

class GlobalPruposeFunctions {
  // GlobalPruposeFunctions._();
  //
  //
  //
  //
  // static String getCurrentLang() {
  //   SharedPreferences sharedPreferences = serviceLocator<SharedPreferences>();
  //   String lang =
  //       sharedPreferences.getString(SharedPreferanceKeys.currentLang) ?? "tr";
  //   return lang;
  // }
  //
  // // static showToast({
  // //   required String svgPath,
  // //   ToastType toastType = ToastType.alert,
  // //   required String text,
  // // }) {
  // //   BotToast.showAttachedWidget(
  // //     attachedBuilder: (_) => AppToast(
  // //       text: text,
  // //       svgPath: svgPath,
  // //       toastType: toastType,
  // //     ),
  // //     duration: const Duration(seconds: 2),
  // //     target: const Offset(1, 1),
  // //     onlyOne: true,
  // //   );
  // // }
  //
  // static showToastWithAction(
  //     {int duration = 10, required String text, required Function onCLick}) {
  //   BotToast.showEnhancedWidget(
  //     toastBuilder: (_) {
  //       return BookRecoverToast(
  //         bookName: text,
  //         onClick: () => onCLick(),
  //       );
  //     },
  //     duration: const Duration(seconds: 10),
  //     onlyOne: true,
  //   );
  // }

  static String? getAccessToken() {
    final prefs = serviceLocator<SharedPreferences>();
    return prefs.getString(SharedPreferanceKeys.accessToken);
  }
  //
  // static Map<String, dynamic>? getUserInfoFromGrooglTokenId(String? token) {
  //   if (token == null) return null;
  //   final List<String> parts = token.split('.');
  //   if (parts.length != 3) {
  //     return null;
  //   }
  //   final String payload = parts[1];
  //   final String normalized = base64Url.normalize(payload);
  //   final String resp = utf8.decode(base64Url.decode(normalized));
  //   final payloadMap = json.decode(resp);
  //   if (payloadMap is! Map<String, dynamic>) {
  //     return null;
  //   }
  //   return payloadMap;
  // }
  //
  // static bool hasTextOverflow(
  //   String text,
  //   TextStyle style, {
  //   double minWidth = 0,
  //   double maxWidth = double.infinity,
  //   int maxLines = 2,
  // }) {
  //   final TextPainter textPainter = TextPainter(
  //     text: TextSpan(text: text, style: style),
  //     maxLines: maxLines,
  //     textDirection: TextDirection.ltr,
  //   )..layout(minWidth: minWidth, maxWidth: maxWidth);
  //   final bool didExceedMaxLines = textPainter.didExceedMaxLines;
  //   return didExceedMaxLines;
  // }
  //
  // static String secondsToTimerString(int seconds) {
  //   final int hours = seconds ~/ 3600;
  //   seconds -= hours * 3600;
  //   final int minutes = seconds ~/ 60;
  //   seconds -= minutes * 60;
  //   final hoursString = hours > 0 ? '${hours.toString().padLeft(2, '0')}:' : '';
  //   final minutesString = '${minutes.toString().padLeft(2, '0')}:';
  //   return '$hoursString$minutesString${seconds.toString().padLeft(2, '0')}';
  // }
  //
  // static ProfileResponseModel? getUserInfo() {
  //   final user = serviceLocator<SharedPreferences>();
  //   String getUser = user.getString(SharedPreferanceKeys.userInfo) ?? "";
  //   return ProfileResponseModel.fromJson(jsonDecode(getUser));
  // }
  //
  // static void setUserInfo(ProfileResponseModel profile) {
  //   final user = serviceLocator<SharedPreferences>();
  //   String userFromModel = jsonEncode(profile.toJson());
  //   user.setString(SharedPreferanceKeys.userInfo, userFromModel);
  // }
  //
  // static void setUserNumCard(String numCard) {
  //   final userNumCard = serviceLocator<SharedPreferences>();
  //   userNumCard.setString(SharedPreferanceKeys.userNumCard, numCard);
  // }
  //
  // static String? getUserNumCard() {
  //   final user = serviceLocator<SharedPreferences>();
  //   return user.getString(SharedPreferanceKeys.userNumCard) ?? "";
  // }
  //
  // static Future<File> cropImage(File file) async {
  //   String subString = file.path;
  //   if (subString.endsWith("png") ||
  //       subString.endsWith("jpg") ||
  //       subString.endsWith("jpeg")) {
  //     File? cropper;
  //
  //     cropper = await ImageCropper().cropImage(
  //         sourcePath: file.path,
  //         aspectRatioPresets: [
  //           CropAspectRatioPreset.square,
  //           CropAspectRatioPreset.ratio3x2,
  //           CropAspectRatioPreset.original,
  //           CropAspectRatioPreset.ratio4x3,
  //           CropAspectRatioPreset.ratio16x9
  //         ],
  //         androidUiSettings: const AndroidUiSettings(
  //             toolbarTitle: 'Cropper',
  //             toolbarColor: Colors.deepOrange,
  //             toolbarWidgetColor: Colors.white,
  //             initAspectRatio: CropAspectRatioPreset.original,
  //             lockAspectRatio: false),
  //         iosUiSettings: const IOSUiSettings(
  //           minimumAspectRatio: 1.0,
  //         ));
  //           print("the cropper is: $cropper");
  //     if (cropper != null) return cropper;
  //
  //
  //     return file;
  //   }
  //
  //   return file;
  // }
  //
  //
  // static fileTypeIsImage({String filePath = "", String fileExtention = ""}) {
  //   String _extention = "";
  //   if (fileExtention.length != 0) {
  //     if (fileExtention == ".jpg" ||
  //         fileExtention == ".png" ||
  //         fileExtention == ".jpeg")
  //       return true;
  //     else
  //       return false;
  //   }
  //   for (int i = filePath.length - 1; i >= 0; i--) {
  //     if (filePath[i] == '.') {
  //       _extention = filePath.substring(i);
  //       break;
  //     }
  //   }
  //   if (_extention == ".jpg" || _extention == ".png" || _extention == ".jpeg")
  //     return true;
  //   return false;
  // }
}
