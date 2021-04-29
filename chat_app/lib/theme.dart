import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final appBarTheme = AppBarTheme(centerTitle: false, elevation: 0);

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: appPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme,
    iconTheme: IconThemeData(color: appContentColorLightTheme),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: appContentColorLightTheme),
    colorScheme: ColorScheme.light(
        primary: appPrimaryColor,
        secondary: appSecondaryColor,
        error: appErrorColor),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: appContentColorLightTheme.withOpacity(0.7),
        unselectedItemColor: appContentColorLightTheme.withOpacity(0.32),
        selectedIconTheme: IconThemeData(color: appPrimaryColor),
        showSelectedLabels: true),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: appPrimaryColor,
    scaffoldBackgroundColor: appContentColorLightTheme,
    appBarTheme: appBarTheme,
    iconTheme: IconThemeData(color: appContentColorDarkTheme),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: appContentColorDarkTheme),
    colorScheme: ColorScheme.dark().copyWith(
      primary: appPrimaryColor,
      secondary: appSecondaryColor,
      error: appErrorColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: appContentColorLightTheme,
      selectedItemColor: Colors.white70,
      unselectedItemColor: appContentColorDarkTheme.withOpacity(0.32),
      selectedIconTheme: IconThemeData(color: appPrimaryColor),
      showSelectedLabels: true,
    ),
  );
}
