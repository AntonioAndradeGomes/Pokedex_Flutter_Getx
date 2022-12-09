import 'package:flutter/material.dart';
import 'package:pokedex_getx_flutter/app/modules/home/widgets/card_pokemon.dart';
import 'package:pokedex_getx_flutter/core/models/pokemon.dart';

class GridPokemons extends StatelessWidget {
  final List<Pokemon> pokemons;
  const GridPokemons({
    super.key,
    required this.pokemons,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent:
            MediaQuery.of(context).size.width <= 320 ? 250 : 300,
        childAspectRatio: 1.4,
        crossAxisSpacing: 5,
        mainAxisSpacing: 6,
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
    );
  }
}
