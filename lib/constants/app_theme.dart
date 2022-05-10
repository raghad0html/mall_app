import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData themeData = ThemeData(
  fontFamily: GoogleFonts.cairo().fontFamily,
  brightness: Brightness.light,
  backgroundColor: AppColors.primaryColor,
  accentColor: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.scaffoldBackGroundColor,
  appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: AppColors.appBarBackGroundColor,
      titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          fontFamily: GoogleFonts.cairo().fontFamily,
          color: AppColors.appBarTitleColor)),
  primaryColor: AppColors.primaryColor,
  textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.blackColor,
      selectionColor: AppColors.grayColor,
      selectionHandleColor: AppColors.grayColor),
  textTheme: const TextTheme(
    subtitle1: TextStyle(color: AppColors.blackColor),
    subtitle2: TextStyle(color: AppColors.grayColor, fontSize: 14.0),
    headline6: TextStyle(
        color: AppColors.blackColor,
        fontWeight: FontWeight.w900,
        fontSize: 20.0),
  ),
  iconTheme: const IconThemeData(color: AppColors.blackColor),
  inputDecorationTheme: const InputDecorationTheme(
    hintStyle: TextStyle(color: AppColors.grayColor),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: AppColors.grayColor,
      ),
    ),
    contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: AppColors.grayColor,
      ),
    ),
    iconColor: AppColors.blackColor,
    floatingLabelStyle: TextStyle(color: AppColors.grayColor),
    labelStyle: TextStyle(
      color: AppColors.grayColor,
      fontWeight: FontWeight.w500,
    ),
    counterStyle: TextStyle(color: AppColors.grayColor),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10)),
      overlayColor:
          MaterialStateProperty.all(AppColors.whiteColor.withAlpha(50)),
      foregroundColor: MaterialStateProperty.all(AppColors.whiteColor),
      backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
      elevation: MaterialStateProperty.all(0),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      textStyle: MaterialStateProperty.all(
        TextStyle(
            color: AppColors.whiteColor,
            fontSize: 18,
            fontFamily: GoogleFonts.cairo().fontFamily,
            fontWeight: FontWeight.w300),
      ),
    ),
  ),
);

class AppColors {
  AppColors._();

  static const primaryColor = Colors.teal;

  //static const primaryColor = Color(0xFFE67E9F);
  static const scaffoldBackGroundColor = Color(0xFFF4F5F9);
  static const appBarBackGroundColor = Colors.teal;
  static const appBarTitleColor = Colors.white;
  static const appYellow = Colors.amberAccent;
  static const appOrange = Colors.orangeAccent;
  static const blackLightColor = Color(0xFF444444);
  static const blackColor = Color(0xFF000000);
  static const redColor = Color(0xFFF01652);
  static const redAccentColor = Colors.redAccent;
  static const grayColor = Colors.grey;
  static const greenColor = Colors.green;
  static const whiteColor = Colors.white;
}
