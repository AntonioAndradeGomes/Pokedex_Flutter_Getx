import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pokedex_getx_flutter/core/constants/get_storage_keys.dart';

class ThemeController extends GetxController {
  final _getStorage = GetStorage();

  late RxBool themeobs;

  @override
  void onInit() {
    super.onInit();
    themeobs = _loadTheme().obs;
  }

  ThemeMode get getThemeMode => _loadTheme() ? ThemeMode.dark : ThemeMode.light;

  bool _loadTheme() => _getStorage.read(GetStorageKeys.theme) ?? false;

  void saveTheme(bool value) {
    _getStorage.write(
      GetStorageKeys.theme,
      value,
    );
    themeobs.value = value;
  }

  void changeThemeMode(ThemeMode themeMode) {
    Get.changeThemeMode(themeMode);
  }
}
