import 'package:flutter/material.dart';
class AppColors {

  static const Color mainBlue = Color(0xFF247CFF) ;
  static const Color darkBlue = Color(0xFF242424) ;
  static const Color gray = Color(0xFF757575) ;
  static const Color lightGray  = Color(0xFFC2C2C2) ;
  static const Color lighterGray  = Color(0xFFEDEDED) ;
  static const Color moreLightGray  = Color(0xFFFDFDFF) ;



  static Color whiteColor = Colors.white;
  static Color primeryColor = mainBlue;
  static Color readingBookLigh = Color(0xffF4F0C6);
  // static Color darkModeIcon = ;
  static Color greenColor = const Color.fromRGBO(173, 209, 114, 1);
  static Color backgroundColor = const Color.fromRGBO(70, 84, 97, 1);

  static const MaterialColor natural = const MaterialColor(
    _naturalPrimaryValue,
    const <int, Color>{
      50: const Color(0xfffafafa),
      100: Colors.grey,
      200: const Color(0xfff1f1f1),
      300: const Color(0xffe0e0e0),
      500: const Color(_naturalPrimaryValue),
      700: const Color(0xff616161),
      900: const Color(0xff000011),
    },
  );

  static const int _naturalPrimaryValue = 0xff9e9e9e;

  static const MaterialColor font = MaterialColor(
    _primaryPrimaryValue,
    <int, Color>{
      50: Color(0xfffafafa),
      100: Color(0xffBEBEBE),
      200: Color(0xffBFBFBF),
      300: Color(0xff6D6D6D),
      400: Color(0xff707070),
      500: Color(0xff9f9f9f),
    },
  );

  static const MaterialColor darkModePrimary = MaterialColor(
    _darkPrimaryValue,
    <int, Color>{
      100: Color(0xffACC0FE),
      200: Color(0xff729CA2),
      300: Color(0xffC4DCDF),
      400: Color(0xffACC0FE),
      500: Color(0xff576674),
    },
  );

  static const MaterialColor primary = MaterialColor(
    _primaryPrimaryValue,
    <int, Color>{
      100: Color(0xfffe893a),
      200: Color(0xffd97532),
      300: Color(0xffDD7842),
      400: Color(0xFFFF893B),
    },
  );

  static const MaterialColor errors = const MaterialColor(
    _primaryPrimaryValue,
    const <int, Color>{
      100: const Color(0xffADD172),
      200: const Color(0xffFF6969),
    },
  );
  static const int _primaryPrimaryValue = 0xfffe893a;
  static const int _darkPrimaryValue = 0xff465461;

}