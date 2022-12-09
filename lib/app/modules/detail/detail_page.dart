import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx_flutter/app/modules/detail/widgets/detail_app_bar_widget.dart';
import 'package:pokedex_getx_flutter/app/modules/detail/widgets/detail_list_widget.dart';
import 'package:pokedex_getx_flutter/app/modules/detail/widgets/details_pokemon_widget.dart';
import 'package:pokedex_getx_flutter/app/modules/home/home_controller.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final _controller = Get.find<HomeController>();
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        onNotification: (notification) {
          if (scrollController.position.pixels > 37) {
            _controller.isOnTop.value = false;
          } else if (scrollController.position.pixels <= 36) {
            _controller.isOnTop.value = true;
          }
          return false;
        },
        child: CustomScrollView(
          controller: scrollController,
          physics: const ClampingScrollPhysics(),
          slivers: [
            DetailAppBarWidget(),
            DetailListWidget(),
            DetailsPokemonWidget(
              scrollController: scrollController,
            ),
          ],
        ),
      ),
    );
  }
}
