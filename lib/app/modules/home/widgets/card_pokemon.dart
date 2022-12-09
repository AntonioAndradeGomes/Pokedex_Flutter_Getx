import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx_flutter/app/modules/home/home_controller.dart';
import 'package:pokedex_getx_flutter/core/models/pokemon.dart';
import 'package:pokedex_getx_flutter/app/modules/home/widgets/type_pokemon.dart';

class CardPokemon extends StatelessWidget {
  final Pokemon pokemon;
  const CardPokemon({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: pokemon.baseColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => Get.find<HomeController>().setIndexToPage(pokemon.num),
            child: Stack(
              children: [
                Positioned(
                  bottom: -10,
                  right: -10,
                  child: Image.asset(
                    'assets/images/pokeball.png',
                    height: 100,
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: Hero(
                    tag: pokemon.id,
                    child: CachedNetworkImage(
                      imageUrl: pokemon.image,
                      height:
                          MediaQuery.of(context).size.width <= 320 ? 50 : 100,
                      fit: BoxFit.fitHeight,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.width <= 320 ? 5 : 15,
                  left: 8,
                  child: Text(
                    pokemon.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize:
                          MediaQuery.of(context).size.width <= 320 ? 15 : 18,
                      color: Colors.white,
                      shadows: const [
                        BoxShadow(
                          color: Colors.blueGrey,
                          offset: Offset(0, 0),
                          spreadRadius: 0.5,
                          blurRadius: 7.5,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.width <= 320 ? 35 : 40,
                  left: 8,
                  child: pokemon.types.length == 1
                      ? TypePokemon(
                          type: pokemon.types.first,
                        )
                      : Column(
                          children: pokemon.types
                              .getRange(0, 2)
                              .toList()
                              .map((e) => TypePokemon(
                                    type: e,
                                  ))
                              .toList(),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
