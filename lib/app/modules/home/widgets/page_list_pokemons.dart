import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:pokedex_getx_flutter/app/modules/home/home_controller.dart';
import 'package:pokedex_getx_flutter/app/modules/home/widgets/grid_pokemons.dart';

class PageListPokemons extends StatelessWidget {
  final _controller = Get.find<HomeController>();
  PageListPokemons({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 155,
      bottom: 0,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Expanded(
            child: Obx(
              () {
                if (_controller.loading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (!_controller.loading.value &&
                    _controller.filterPokemons.value == null) {
                  return const Center(
                    child: Text(
                      'Erro ao buscar a lista de pokemons',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  );
                }
                final pokemons = _controller.filterPokemons.value!;
                return RefreshIndicator(
                  onRefresh: () => _controller.getAllPokemons(),
                  child: GridPokemons(
                    pokemons: pokemons,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
