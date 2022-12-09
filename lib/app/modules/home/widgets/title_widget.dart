import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:pokedex_getx_flutter/core/controllers/theme_controller.dart';

class TitleWidget extends StatelessWidget {
  final _themeController = Get.find<ThemeController>();
  TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Positioned(
        top: 50,
        left: 10,
        child: Text(
          'Pokedex',
          style: TextStyle(
            color: _themeController.themeobs.value
                ? Colors.white.withOpacity(0.6)
                : Colors.black.withOpacity(0.6),
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
