import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx_flutter/app/modules/detail/widgets/evoltion_pokemon.dart';
import 'package:pokedex_getx_flutter/app/modules/home/home_controller.dart';
import 'package:pokedex_getx_flutter/app/modules/home/widgets/type_pokemon.dart';
import 'package:pokedex_getx_flutter/core/models/pokemon.dart';

class DetailsPokemonWidget extends StatelessWidget {
  final _controller = Get.find<HomeController>();
  final ScrollController scrollController;

  DetailsPokemonWidget({
    super.key,
    required this.scrollController,
  });

  void animateToInit() {
    scrollController.animateTo(
      0,
      duration: const Duration(
        milliseconds: 250,
      ),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        child: Stack(
          children: [
            Get.isDarkMode
                ? Container(
                    color: Colors.black,
                  )
                : Obx(
                    () => Container(
                      color: _controller.selectedPokemon.baseColor,
                    ),
                  ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 30,
                          bottom: 10,
                        ),
                        child: Text(
                          'Pokemon data',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      //altura
                      Text(
                        'Heigth: ${_controller.selectedPokemon.height}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      //peso
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Text(
                          'Weight: ${_controller.selectedPokemon.weight}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      //tipos
                      const Text(
                        'Types',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: _controller.selectedPokemon.types
                            .map(
                              (e) => TypePokemon(
                                type: e,
                                horizontalMargin: 5,
                                color: Pokemon.color(
                                      type: e,
                                    ) ??
                                    Colors.pink,
                              ),
                            )
                            .toList(),
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      //fraquesas
                      if (_controller.selectedPokemon.weaknesses != null)
                        Column(
                          children: [
                            const Text(
                              'Weaknesses',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Wrap(
                              alignment: WrapAlignment.center,
                              children: _controller.selectedPokemon.weaknesses!
                                  .map(
                                    (e) => TypePokemon(
                                      type: e,
                                      horizontalMargin: 5,
                                      color: Pokemon.color(
                                            type: e,
                                          ) ??
                                          Colors.pink,
                                    ),
                                  )
                                  .toList(),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      //prev evolutions
                      if (_controller.selectedPokemon.prevEvolution != null)
                        Column(
                          children: [
                            const Text(
                              'Prev. Evolutions',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Wrap(
                              alignment: WrapAlignment.center,
                              children:
                                  _controller.selectedPokemon.prevEvolution!
                                      .map(
                                        (e) => EvolutionPokemon(
                                          imageUrl: _controller
                                              .pokemonFromEvolution(e)
                                              .image,
                                          onTap: () {
                                            _controller.setIndex(e.num);
                                            animateToInit();
                                          },
                                        ),
                                      )
                                      .toList(),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      //next evolutions
                      if (_controller.selectedPokemon.nextEvolution != null)
                        Column(
                          children: [
                            const Text(
                              'Next Evolutions',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Wrap(
                              alignment: WrapAlignment.center,
                              children:
                                  _controller.selectedPokemon.nextEvolution!
                                      .map(
                                        (e) => EvolutionPokemon(
                                          imageUrl: _controller
                                              .pokemonFromEvolution(e)
                                              .image,
                                          onTap: () {
                                            _controller.setIndex(e.num);
                                            animateToInit();
                                          },
                                        ),
                                      )
                                      .toList(),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
