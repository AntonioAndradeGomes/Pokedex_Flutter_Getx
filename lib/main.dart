import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pokedex_getx_flutter/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
    AppWidget(),
  );
}
