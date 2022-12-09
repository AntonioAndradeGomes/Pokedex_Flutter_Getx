import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx_flutter/app/modules/home/home_controller.dart';

class DetailListWidget extends StatelessWidget {
  final _controller = Get.find<HomeController>();
  DetailListWidget({super.key});

  Color? color(bool diff) {
    if (Get.isDarkMode && diff) {
      return Colors.white.withOpacity(0.4);
    }
    if (!Get.isDarkMode && diff) {
      return Colors.black.withOpacity(0.4);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Obx(
        () => Container(
          color: Get.isDarkMode
              ? Colors.black
              : _controller.selectedPokemon.baseColor,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        _controller.selectedPokemon.name,
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      '#${_controller.selectedPokemon.num}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                width: double.infinity,
                child: PageView(
                  onPageChanged: (index) {
                    _controller.indexPokemon.value = index;
                  },
                  controller: _controller.pageController,
                  children: _controller.pokemons!.map((e) {
                    bool diff = e.id != _controller.selectedPokemon.id;
                    return AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: diff ? 0.4 : 1.0,
                      child: TweenAnimationBuilder<double>(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn,
                        tween: Tween<double>(
                          end: diff ? 100 : 300,
                          begin: diff ? 300 : 100,
                        ),
                        builder: (context, value, child) {
                          return Center(
                            child: CachedNetworkImage(
                              imageUrl: e.image,
                              width: value,
                              fit: BoxFit.contain,
                              color: color(diff),
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
