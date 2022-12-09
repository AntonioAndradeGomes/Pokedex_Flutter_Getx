import 'package:flutter/material.dart';
import 'package:pokedex_getx_flutter/core/theme/colors.dart';

class Themes {
  static final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppColors.blueColor,
    brightness: Brightness.light,
  );

  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    primaryColor: AppColors.blueColor,
    brightness: Brightness.dark,
  );
}
