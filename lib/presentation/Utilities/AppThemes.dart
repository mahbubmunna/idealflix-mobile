import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_tv/presentation/Utilities/AppColors.dart';

ThemeData appTheme(){
  return ThemeData(
    backgroundColor: AppColors.backgroundColor,
    primaryColor: AppColors.primaryColor,
    accentColor: AppColors.secondaryColor,
    appBarTheme: AppBarTheme(
      color: AppColors.backgroundColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColors.primaryColor,
        size: 20,
      ),
      textTheme: TextTheme(
        headline1: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.secondaryColor,
        ),
        headline6: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.secondaryColor,
        )
      ),

    ),
    textTheme: TextTheme(
      headline1: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppColors.primaryColor,
      ),
      bodyText1: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.textColor,
      ),
    ),
    fontFamily: "Poppins"
  );
}