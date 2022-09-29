import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/const.dart';

class AppTheme {
  late double _textHeight;
  late String _fontName;

  AppTheme({
    required BuildContext context,
  }) {
    _fontName = 'SF';
    _textHeight = 1.3;
  }

  ThemeData getDarkThemeData() {
    final ThemeData themeData = ThemeData(
      highlightColor: kDarkGrayColor,
      canvasColor: kLightGrayColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: kLightGrayColor,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.grey,
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          side: const BorderSide(color: kBlueColorLight),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kBlueColorLight,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: kBlueColorLight,
        ),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: kLightGrayColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 22,
        ),
        errorMaxLines: 5,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            width: 2,
            color: Colors.red,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(width: 1, color: Colors.red),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            width: 0.5,
            color: Colors.white,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(width: 1, color: Colors.grey),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.white),
        ),
        errorStyle: TextStyle(
          height: _textHeight,
          fontSize: 16,
          fontFamily: '${_fontName}Book',
        ),
        hintStyle: TextStyle(
          height: _textHeight,
          fontSize: 16,
          fontFamily: '${_fontName}Book',
        ),
      ),
      appBarTheme: const AppBarTheme(
        color: Colors.black38,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: kLightGrayColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kBlueColorLight,
        unselectedItemColor: Colors.grey,
      ),
      textTheme: getTextTheme(Colors.white),
        snackBarTheme: const SnackBarThemeData(
            actionTextColor:  Color(0xff52B1E4),
            backgroundColor: Colors.black,
            disabledActionTextColor: Colors.black,
            contentTextStyle: TextStyle(color: Colors.white,fontSize: 18),
            elevation: 20
        )
    );

    return themeData.copyWith(
      colorScheme: themeData.colorScheme.copyWith(
        secondary: const Color(0xff52B1E4),
        onPrimary: Colors.white,
      ),
    );
  }

  ThemeData getLightThemeData() {
    final ThemeData themeData = ThemeData(
      highlightColor: kOffWhiteColor,
      canvasColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: Colors.white,
      brightness: Brightness.light,
      scaffoldBackgroundColor: kOffWhiteColor,
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          side: const BorderSide(color: kBlueColorDark),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kBlueColorDark,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: kBlueColorDark,
        ),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 22,
        ),
        errorMaxLines: 5,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(width: 2, color: Colors.black),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(width: 2, color: Colors.red),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(width: 1, color: Colors.red),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(
            width: 0.5,
            color: Colors.black38,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(width: 1, color: Colors.grey),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(color: Colors.black38),
        ),
        errorStyle: TextStyle(
          height: _textHeight,
          fontSize: 12,
          color: Colors.red,
          fontFamily: '${_fontName}Book',
        ),
        hintStyle: TextStyle(
          height: _textHeight,
          fontSize: 12,
          fontFamily: '${_fontName}Book',
        ),
      ),
      appBarTheme: const AppBarTheme(
        color: Color(0xff52B1E4),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kBlueColorDark,
        unselectedItemColor: Colors.grey,
      ),
      textTheme: getTextTheme(Colors.black),

        snackBarTheme: const SnackBarThemeData(
            actionTextColor:  Colors.white,
            backgroundColor:  Color(0xff52B1E4),
            contentTextStyle: TextStyle(color: Colors.white,fontSize: 18),
            elevation: 20
        )
    );

    return themeData.copyWith(
      colorScheme: themeData.colorScheme.copyWith(
        secondary: kBlueColorDark,
        primary: const Color(0xff52B1E4),
        onPrimary: Colors.black,
        secondaryContainer: kSecondaryColor,
      ),
    );
  }

  TextTheme getTextTheme(Color color) {
    return GoogleFonts.mulishTextTheme().copyWith(
      headline1: GoogleFonts.mulish(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: color,
      ),
      headline2: GoogleFonts.mulish(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: color,
      ),
      headline3: GoogleFonts.mulish(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: color,
      ),
      headline4: GoogleFonts.mulish(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: color,
      ),
      headline5: GoogleFonts.mulish(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: color,
      ),
      headline6: GoogleFonts.mulish(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: color,
      ),
      subtitle1: GoogleFonts.mulish(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      subtitle2: GoogleFonts.mulish(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      bodyText1: GoogleFonts.mulish(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: color,
      ),
      bodyText2: GoogleFonts.mulish(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      caption: GoogleFonts.mulish(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      button: GoogleFonts.mulish(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: color,
      ),
    );
  }
}
