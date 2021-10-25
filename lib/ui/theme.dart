import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluishColor = Color(0xFF4e5ae8);
const Color yellowColor = Color(0xFFFFB746);
const Color pinkColor = Color(0xFFff4667);
const Color white = Colors.white;
const Color primaryColor = bluishColor;
const Color darkGreyColor = Color(0xFF121212);
const Color darkHeaderColor = Color(0xFF424242);

class Themes {
  static final lightMode = ThemeData(
    backgroundColor: Colors.white,
    primaryColor: bluishColor,
    brightness: Brightness.light,
  );

  static final darkMode = ThemeData(
      backgroundColor: darkGreyColor,
      primaryColor: darkGreyColor,
      brightness: Brightness.dark);
}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
    // ignore: prefer_const_constructors
    textStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode?Colors.grey[400]:Colors.grey
    ),
  );
}

TextStyle get headingStyle {
  return GoogleFonts.lato(
    // ignore: prefer_const_constructors
    textStyle: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode?Colors.white:Colors.black
    ),
  );
}

TextStyle get titleStyle {
  return GoogleFonts.lato(
    // ignore: prefer_const_constructors
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Get.isDarkMode?Colors.white:Colors.black
    ),
  );
}
TextStyle get subTitleStyle {
  return GoogleFonts.lato(
    // ignore: prefer_const_constructors
    textStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Get.isDarkMode?Colors.grey[100]:Colors.grey[600]
    ),
  );
}