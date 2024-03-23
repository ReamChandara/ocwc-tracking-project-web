import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const MaterialColor primaryswatch =
      MaterialColor(_primaryswatchPrimaryValue, <int, Color>{
    50: Color(0xFFE8F2FC),
    100: Color(0xFFC6DEF8),
    200: Color(0xFFA1C8F4),
    300: Color(0xFF7BB2F0),
    400: Color(0xFF5EA2EC),
    500: Color(_primaryswatchPrimaryValue),
    600: Color(0xFF3C89E6),
    700: Color(0xFF337EE3),
    800: Color(0xFF2B74DF),
    900: Color(0xFF1D62D9),
  });
  static const int _primaryswatchPrimaryValue = 0xFF4291E9;

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: false,
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      titleTextStyle: AppTextStyle.bold24(
        color: Colors.black,
      ),
      iconTheme: const IconThemeData(
        color: AppTheme.primaryswatch,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      elevation: 0,
    ),
    fontFamily: 'SourceSansPro-Regular',
    // fontFamily: 'Battambang',
    textTheme:
        TextTheme(bodySmall: AppTextStyle.regular16(color: Colors.black)),
    iconTheme: const IconThemeData(size: 33, color: Colors.white),
    useMaterial3: false,
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: false,
      backgroundColor: AppColors.darkColor,
      titleTextStyle: AppTextStyle.bold26(
        color: Colors.white,
      ),
      iconTheme: const IconThemeData(
        color: AppTheme.primaryswatch,
        size: 50,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      elevation: 0,
    ),
    fontFamily: 'SourceSansPro-Regular',
    textTheme:
        TextTheme(bodySmall: AppTextStyle.regular16(color: Colors.black)),
    iconTheme: const IconThemeData(size: 33, color: Colors.white),
    useMaterial3: false,
  );
}

class AppColors {
  AppColors._();

  static const background = Color(0xFFF5F5F5);
  static var blur = const Color(0xFFC9CCD0);
  static var redColor = Colors.red.shade900;
  static const white = Colors.white;
  static const grey = Color.fromARGB(255, 237, 237, 237);
  static const darkColor = Color.fromRGBO(35, 52, 95, 1);
  static const darkColorLight = Color.fromRGBO(57, 77, 127, 1);
  static const darkIconColor = Color.fromRGBO(72, 113, 196, 1);
}

class AppTextStyle {
  AppTextStyle._();
  static TextStyle regular10({Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 10,
      color: color ?? AppColors.white,
    );
  }

  static TextStyle regular11({Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 11,
      color: color ?? AppColors.white,
    );
  }

  static TextStyle regular12({Color? color}) {
    return TextStyle(
      fontFamily: 'SourceSansPro-Regular',
      fontWeight: FontWeight.normal,
      fontSize: 12,
      color: color ?? AppColors.white,
    );
  }

  static TextStyle regular13({Color? color}) {
    return TextStyle(
      fontFamily: 'SourceSansPro-Regular',
      fontWeight: FontWeight.normal,
      fontSize: 13,
      color: color ?? AppColors.white,
    );
  }

  static TextStyle regular14({double? height, Color? color, bool? underline}) {
    return TextStyle(
      fontWeight: FontWeight.normal,
      height: height,
      decoration:
          underline == true ? TextDecoration.underline : TextDecoration.none,
      fontSize: 14,
      color: color ?? Colors.black,
    );
  }

  static TextStyle regular16({Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 16,
      color: color ?? AppColors.white,
    );
  }

  static TextStyle regular15({Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 15.5,
      color: color ?? AppColors.white,
    );
  }

  static TextStyle regular18({Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 18,
      color: color ?? AppColors.white,
    );
  }

  static TextStyle regular20({Color? color, double? height}) {
    return TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 20,
      height: height,
      color: color ?? AppColors.white,
    );
  }

  static TextStyle regular22({Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 22,
      color: color ?? AppColors.white,
    );
  }

  static TextStyle regular24({Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 24,
      color: color ?? AppColors.white,
    );
  }

  static TextStyle regular28({Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 28,
      color: color ?? AppColors.white,
    );
  }

  static TextStyle medium14({Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: color ?? AppColors.white,
    );
  }

  static TextStyle medium16({Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: color ?? AppColors.white,
    );
  }

  static TextStyle medium18({Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18,
      color: color ?? AppColors.white,
    );
  }

  static TextStyle medium28({Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 28,
      color: color ?? AppColors.white,
    );
  }

  static TextStyle bold14({Color? color}) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: color ?? Colors.black,
    );
  }

  static TextStyle bold10({Color? color}) {
    return TextStyle(
      fontSize: 10,
      color: color ?? AppColors.white,
    );
  }

  static TextStyle bold5({Color? color}) {
    return TextStyle(
      fontSize: 5,
      color: color ?? AppColors.white,
    );
  }

  static TextStyle bold12({Color? color}) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: color ?? AppColors.white,
    );
  }

  static TextStyle bold16({Color? color, double? height, String? fontFamily}) {
    return TextStyle(
      height: height,
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: color ?? Colors.black,
    );
  }

  static TextStyle bold17({Color? color, double? height, String? fontFamily}) {
    return TextStyle(
      height: height,
      fontWeight: FontWeight.bold,
      fontSize: 17,
      color: color ?? AppColors.white,
    );
  }

  static TextStyle bold13({Color? color}) {
    return TextStyle(
      fontSize: 13,
      color: color ?? AppColors.white,
    );
  }

  static TextStyle bold18({Color? color, double? height}) {
    return TextStyle(
      height: height,
      fontSize: 18,
      color: color ?? Colors.black,
    );
  }

  static TextStyle bold19({Color? color, double? height}) {
    return TextStyle(
      height: height,
      fontSize: 19,
      color: color ?? AppColors.white,
    );
  }

  static TextStyle bold20({Color? color, String? fontFamily}) {
    return TextStyle(
      fontSize: 20,
      color: color ?? AppColors.white,
    );
  }

  static TextStyle bold22({Color? color, String? fontFamily}) {
    return TextStyle(
      fontSize: 22,
      color: color ?? AppColors.white,
    );
  }

  static TextStyle bold24({Color? color, String? fontFamily}) {
    return TextStyle(
      fontSize: 24,
      color: color ?? AppColors.white,
    );
  }

  static TextStyle bold26({Color? color, String? fontFamily}) {
    return TextStyle(
      fontSize: 26,
      color: color ?? AppColors.white,
    );
  }

  static TextStyle bold28({Color? color}) {
    return TextStyle(
      fontSize: 28,
      color: color ?? AppColors.white,
    );
  }

  static TextStyle bold40({Color? color, String? fontFamily}) {
    return TextStyle(
      fontSize: 40,
      color: color ?? AppColors.white,
    );
  }

  static TextStyle bold50({Color? color, String? fontFamily}) {
    return TextStyle(
      fontSize: 50,
      color: color ?? AppColors.white,
    );
  }
}
