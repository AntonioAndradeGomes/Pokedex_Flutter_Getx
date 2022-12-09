import 'package:get/get.dart';
import 'package:pokedex_getx_flutter/core/services/http_manager.dart';
import 'package:pokedex_getx_flutter/app/modules/home/home_controller.dart';
import 'package:pokedex_getx_flutter/app/modules/home/repository/pokemons_repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      HomeController(
        repository: PokemonsRepository(
          httpManager: HttpManager(),
        ),
      ),
      permanent: true,
    );
  }
}
