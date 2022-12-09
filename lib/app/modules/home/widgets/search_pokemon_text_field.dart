import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:pokedex_getx_flutter/app/modules/home/home_controller.dart';

class SearchPokemonTextField extends StatelessWidget {
  final _controller = Get.find<HomeController>();
  SearchPokemonTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => TextField(
          controller: _controller.searchTextController,
          onChanged: (value) {
            _controller.searchPokemon(value);
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(
              10,
            ),
            prefixIcon: const Icon(
              Icons.search,
            ),
            suffixIcon: _controller.searchText.value.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      _controller.searchTextController.clear();
                      _controller.searchPokemon('');
                      FocusScope.of(context).unfocus();
                    },
                    icon: const Icon(
                      Icons.close,
                    ),
                  )
                : null,
            hintText: 'Pesquisar',
            isDense: true,
            border: const OutlineInputBorder(),
          ),
          enabled: !_controller.loading.value,
        ),
      ),
    );
  }
}
