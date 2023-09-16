import 'package:shared_preferences/shared_preferences.dart';

abstract class Repository {
  static saveValue(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('label', value);
  }

  static getValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int value = prefs.getInt('label') ?? 0;
    return value;
  }
}