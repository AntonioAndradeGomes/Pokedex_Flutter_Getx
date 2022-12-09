import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx_flutter/core/controllers/theme_controller.dart';
import 'package:pokedex_getx_flutter/core/theme/app_theme.dart';
import 'package:pokedex_getx_flutter/routes/app_pages.dart';

class AppWidget extends StatelessWidget {
  AppWidget({super.key});
  final themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: themeController.getThemeMode,
      getPages: AppPages.pages,
      initialRoute: AppPages.initialRoute,
    );
  }
}
