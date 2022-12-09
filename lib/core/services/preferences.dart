import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  Future<bool?> isThemeDark() async {
    final prefs = await SharedPreferences.getInstance();
    final isLight = prefs.getBool('isThemeDark');
    return isLight;
  }

  Future<void> setTheme(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isThemeDark', value);
  }
}
