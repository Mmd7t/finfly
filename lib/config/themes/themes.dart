import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:finfly/config/constants/app_colors.dart';

class AppTheme {
  static final ThemeData light = ThemeData.light().copyWith(
    inputDecorationTheme: commonTheme.inputDecorationTheme,
    scaffoldBackgroundColor: AppColors.bg,
    primaryColor: AppColors.primaryBlue,
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primaryBlue,
      secondary: AppColors.red,
      error: AppColors.red,
      surfaceTint: Colors.transparent,
      primaryContainer: Colors.white,
    ),
    buttonTheme: const ButtonThemeData(
      height: 55,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      buttonColor: AppColors.primaryBlue,
      textTheme: ButtonTextTheme.normal,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.bg,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.bg,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    ),
    checkboxTheme: commonTheme.checkboxTheme,
    textTheme: commonTheme.textTheme,
    shadowColor: AppColors.shadowColor,
    cardColor: Colors.white,
    cardTheme: commonTheme.cardTheme,
  );

  static final ThemeData dark = ThemeData.dark().copyWith(
    inputDecorationTheme: commonTheme.inputDecorationTheme.copyWith(
      fillColor: AppColors.darkCard,
      hintStyle: TextStyle(
        color: AppColors.accentDarkCard.withOpacity(0.4),
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      height: 55,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      buttonColor: AppColors.darkBlue,
      textTheme: ButtonTextTheme.normal,
    ),
    scaffoldBackgroundColor: AppColors.darkBg,
    primaryColor: AppColors.darkBlue,
    cardColor: AppColors.darkCard,
    colorScheme: const ColorScheme.dark().copyWith(
      surfaceTint: Colors.transparent,
      primary: AppColors.darkBlue,
      secondary: AppColors.red,
      error: AppColors.red,
      primaryContainer: AppColors.darkCard,
    ),
    shadowColor: Colors.transparent,
    checkboxTheme: commonTheme.checkboxTheme,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.darkBg,
      iconTheme: IconThemeData(color: Colors.white),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.darkBg,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    ),
    textTheme: commonTheme.textTheme,
    cardTheme: commonTheme.cardTheme,
  );

  static final ThemeData commonTheme = ThemeData(
    cardTheme: const CardTheme(
      shadowColor: AppColors.shadowColor,
      elevation: 8,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(
        color: AppColors.textColor1,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: const EdgeInsets.all(22),
      fillColor: AppColors.textfieldColor,
      filled: true,
      suffixIconColor: AppColors.red,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: AppColors.red, width: 1),
      ),
    ),
    textTheme: ThemeData().textTheme.copyWith(
          headlineLarge: ThemeData().textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.normal,
                fontFamily: 'Poppin',
              ),
          headlineMedium: ThemeData().textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppin',
              ),
          headlineSmall: ThemeData().textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppin',
              ),
          titleLarge: ThemeData().textTheme.titleLarge!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppin',
              ),
          titleMedium: ThemeData().textTheme.titleMedium!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppin',
              ),
          titleSmall: ThemeData().textTheme.titleSmall!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppin',
              ),
          bodyLarge: ThemeData().textTheme.bodyLarge!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                fontFamily: 'Poppin',
              ),
          bodyMedium: ThemeData().textTheme.bodyMedium!.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                fontFamily: 'Poppin',
              ),
          bodySmall: ThemeData().textTheme.bodySmall!.copyWith(
                fontSize: 11,
                fontWeight: FontWeight.normal,
                fontFamily: 'Poppin',
              ),
          labelLarge: ThemeData().textTheme.labelLarge!.copyWith(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppin',
              ),
          labelSmall: ThemeData().textTheme.labelSmall!.copyWith(
                fontSize: 9,
                fontWeight: FontWeight.normal,
                fontFamily: 'Poppin',
              ),
        ),
    useMaterial3: true,
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all<Color>(const Color(0xFFF3F4FD)),
      checkColor: WidgetStateProperty.all<Color>(const Color(0xFF14D49B)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      // side: const BorderSide(width: 15, color: Color(0xFFF3F4FD)),
    ),
  );
}
