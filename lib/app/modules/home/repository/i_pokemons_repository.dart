import 'package:pokedex_getx_flutter/core/models/pokemon.dart';
import 'package:pokedex_getx_flutter/app/modules/home/result/pokemon_result.dart';

abstract class IPokemonsRepository {
  Future<PokemonResult<List<Pokemon>>> getAllPokemons();
}
