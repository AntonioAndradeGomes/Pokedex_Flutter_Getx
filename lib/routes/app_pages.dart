import 'package:get/get.dart';
import 'package:pokedex_getx_flutter/app/modules/detail/detail_page.dart';
import 'package:pokedex_getx_flutter/app/modules/home/home_binding.dart';
import 'package:pokedex_getx_flutter/app/modules/home/home_page.dart';
import 'package:pokedex_getx_flutter/routes/app_routes.dart';

abstract class AppPages {
  static String initialRoute = AppRoutes.baseRoute;

  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.baseRoute,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.detail,
      page: () => const DetailPage(),
    ),
  ];
}
