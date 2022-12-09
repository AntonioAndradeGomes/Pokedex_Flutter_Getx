import 'package:flutter/material.dart';
import 'package:pokedex_getx_flutter/app/modules/home/widgets/search_pokemon_text_field.dart';
import 'package:pokedex_getx_flutter/app/modules/home/widgets/switch_theme.dart';

class RowSettings extends StatelessWidget {
  const RowSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 90,
      left: 10,
      right: 10,
      child: SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            SearchPokemonTextField(),
            const SizedBox(
              width: 10,
            ),
            SwitchThemePokedex(),
          ],
        ),
      ),
    );
  }
}
