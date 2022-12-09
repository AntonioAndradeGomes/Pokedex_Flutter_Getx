import 'package:pokedex_getx_flutter/core/constants/endpoints.dart';
import 'package:pokedex_getx_flutter/core/services/http_manager.dart';
import 'package:pokedex_getx_flutter/core/models/pokemon.dart';
import 'package:pokedex_getx_flutter/app/modules/home/repository/i_pokemons_repository.dart';
import 'package:pokedex_getx_flutter/app/modules/home/result/pokemon_result.dart';

class PokemonsRepository implements IPokemonsRepository {
  final HttpManager httpManager;
  PokemonsRepository({
    required this.httpManager,
  });

  @override
  Future<PokemonResult<List<Pokemon>>> getAllPokemons() async {
    final result = await httpManager.restRequest(
      url: Endpoints.allPokemons,
      method: HttpMethods.get,
    );

    if (result.containsKey('pokemon')) {
      List<Pokemon> data = List<Map<String, dynamic>>.from(result['pokemon'])
          .map((e) => Pokemon.fromMap(e))
          .toList();
      return PokemonResult.success(data);
    } else {
      return PokemonResult.error(
        'Erro ao capturar os pokemons do servidor',
      );
    }
  }
}
