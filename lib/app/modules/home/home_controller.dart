import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx_flutter/core/models/evolution.dart';
import 'package:pokedex_getx_flutter/core/models/pokemon.dart';
import 'package:pokedex_getx_flutter/app/modules/home/repository/i_pokemons_repository.dart';
import 'package:pokedex_getx_flutter/routes/app_routes.dart';

class HomeController extends GetxController {
  final IPokemonsRepository repository;
  HomeController({
    required this.repository,
  });

  RxBool loading = true.obs;

  List<Pokemon>? pokemons;

  Rx<List<Pokemon>?> filterPokemons = null.obs;

  TextEditingController searchTextController = TextEditingController();

  RxString searchText = ''.obs;

  RxInt indexPokemon = 0.obs;

  RxBool isOnTop = false.obs;

  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    getAllPokemons();
  }

  Future<void> getAllPokemons() async {
    loading.value = true;
    final result = await repository.getAllPokemons();
    result.when(success: (data) {
      pokemons = data;
      update();
      filterPokemons = pokemons.obs;
    }, error: (message) {
      pokemons = null;
      update();
      filterPokemons = null.obs;
    });
    loading.value = false;
  }

  void searchPokemon(String? value) {
    if (value == null || value.isEmpty) {
      filterPokemons.value = pokemons;
      searchText.value = '';
    } else {
      final result = pokemons == null
          ? null
          : pokemons!
              .where((element) =>
                  element.name.toLowerCase().contains(value.toLowerCase()))
              .toList();
      filterPokemons.value = result;
      searchText.value = value;
    }
  }

  void setIndexToPage(String num) {
    indexPokemon.value = pokemons!
        .indexOf(pokemons!.where((element) => element.num == num).first);
    pageController = PageController(
      viewportFraction: 0.5,
      initialPage: indexPokemon.value,
    );
    Get.toNamed(AppRoutes.detail);
  }

  Pokemon get selectedPokemon => pokemons![indexPokemon.value];

  Pokemon pokemonFromEvolution(Evolution evolution) {
    return pokemons!.where((element) => element.num == evolution.num).first;
  }

  void setIndex(String num) {
    indexPokemon.value = pokemons!
        .indexOf(pokemons!.where((element) => element.num == num).first);
    pageController.jumpToPage(indexPokemon.value);
  }
}
