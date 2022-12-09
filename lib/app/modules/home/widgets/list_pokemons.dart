import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:pokedex_getx_flutter/app/modules/home/home_controller.dart';
import 'package:pokedex_getx_flutter/app/modules/home/widgets/card_pokemon.dart';

class ListPokemons extends StatelessWidget {
  final _controller = Get.find<HomeController>();
  ListPokemons({super.key});

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
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.4,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 20,
                      left: 10,
                      right: 10,
                    ),
                    physics: const ScrollPhysics(),
                    itemCount: pokemons.length,
                    itemBuilder: (_, index) => CardPokemon(
                      pokemon: pokemons[index],
                    ),
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
