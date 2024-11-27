import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:town_squar/app/themes/app_colors.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    primarySwatch: AppColors.materialSteelBlue,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.primary,
      secondary: AppColors.lightIntensity,
      brightness: Brightness.light,
    ),
    textTheme: TextTheme(
      // bodyLarge: GoogleFonts.roboto(
      //   textStyle: const TextStyle(
      //     fontSize: 16,
      //     fontWeight: FontWeight.normal,
      //     color: AppColors.textPrimary,
      //   ),
      // ),
      // bodyMedium: GoogleFonts.montserrat(
      //   textStyle: const TextStyle(
      //     fontSize: 16,
      //     fontWeight: FontWeight.normal,
      //     color: AppColors.textPrimary,
      //   ),
      // ),
      // bodySmall: GoogleFonts.jost(
      //   textStyle: const TextStyle(
      //     fontSize: 16,
      //     fontWeight: FontWeight.normal,
      //     color: AppColors.textPrimary,
      //   ),
      // ),
      // labelLarge: GoogleFonts.inter(
      //   textStyle: const TextStyle(
      //     fontSize: 16,
      //     fontWeight: FontWeight.normal,
      //     color: Colors.white,
      //   ),
      // ),
      bodyLarge: const TextStyle(
        fontFamily: 'SFProDisplay',
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
      bodyMedium: const TextStyle(
        fontFamily: 'SFProDisplay',
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
      bodySmall: const TextStyle(
        fontFamily: 'SFProDisplay',
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
      labelLarge: const TextStyle(
        fontFamily: 'SFProDisplay',
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
      displaySmall: const TextStyle(
        fontFamily: 'SFProDisplay',
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0,
      centerTitle: false,
      foregroundColor: AppColors.background,
      titleTextStyle: const TextStyle(
        fontFamily: 'SFProDisplay',
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.textSecondary,
      thickness: 2,
    ),
    // inputDecorationTheme: InputDecorationTheme(
    //   filled: true,
    //   fillColor: AppColors.lightIntensity,
    //   labelStyle: const TextStyle(color: AppColors.textPrimary),
    //   floatingLabelStyle: const TextStyle(color: AppColors.primary),
    //   focusedBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(12),
    //     borderSide:
    //         const BorderSide(color: AppColors.lightIntensity, width: 2.0),
    //   ),
    //   enabledBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(12),
    //     borderSide:
    //         const BorderSide(color: AppColors.lightIntensity, width: 1.0),
    //   ),
    //   errorBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(12),
    //     borderSide: const BorderSide(color: Colors.red, width: 1.0),
    //   ),
    //   focusedErrorBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(12),
    //     borderSide: const BorderSide(
    //       color: Colors.red,
    //       width: 2.0,
    //     ),
    //   ),
    // ),
  );

  static final darkTheme = ThemeData(
    primarySwatch: AppColors.materialSteelBlue,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.primary,
      secondary: AppColors.lightIntensity,
      brightness: Brightness.dark,
    ),
    //textTheme: GoogleFonts.interTextTheme(),
  );
}
