import 'package:flutter/material.dart';
import 'package:pokedex_getx_flutter/app/modules/home/widgets/page_list_pokemons.dart';
import 'package:pokedex_getx_flutter/app/modules/home/widgets/pokeball.dart';
import 'package:pokedex_getx_flutter/app/modules/home/widgets/row_settings.dart';
import 'package:pokedex_getx_flutter/app/modules/home/widgets/title_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const Pokeball(),
            TitleWidget(),
            const RowSettings(),
            PageListPokemons(),
          ],
        ),
      ),
    );
  }
}
