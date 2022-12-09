import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx_flutter/app/modules/home/home_controller.dart';

class DetailAppBarWidget extends StatelessWidget {
  final _controller = Get.find<HomeController>();
  DetailAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SliverAppBar(
        pinned: true,
        elevation: 0,
        backgroundColor: Get.isDarkMode
            ? Colors.black
            : _controller.selectedPokemon.baseColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.chevron_left,
          ),
        ),
        centerTitle: false,
        title: AnimatedOpacity(
          duration: const Duration(
            milliseconds: 300,
          ),
          opacity: _controller.isOnTop.value ? 0 : 1,
          child: Text(
            _controller.selectedPokemon.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
