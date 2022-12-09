import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:pokedex_getx_flutter/core/controllers/theme_controller.dart';

class SwitchThemePokedex extends StatelessWidget {
  final _themeController = Get.find<ThemeController>();
  SwitchThemePokedex({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => FlutterSwitch(
        showOnOff: true,
        activeText: 'DARK',
        inactiveText: 'LIGHT',
        valueFontSize: 8,
        activeColor: const Color.fromRGBO(34, 35, 40, 1),
        activeIcon: Icon(
          Icons.dark_mode_rounded,
          color: Colors.yellow.shade50,
        ),
        activeToggleColor: const Color.fromRGBO(20, 21, 24, 1),
        inactiveColor: Colors.black.withOpacity(0.2),
        inactiveIcon: Icon(
          Icons.light_mode_rounded,
          color: Colors.yellow.shade800,
        ),
        inactiveToggleColor: Colors.white,
        value: _themeController.themeobs.value,
        onToggle: (value) {
          if (value) {
            _themeController.saveTheme(value);
            _themeController.changeThemeMode(ThemeMode.dark);
          } else {
            _themeController.saveTheme(value);
            _themeController.changeThemeMode(ThemeMode.light);
          }
        },
      ),
    );
  }
}
