import 'package:shared_preferences/shared_preferences.dart';

class CRUDDataLocally {
  late SharedPreferences prefs;

  static saveTokenLocally(String key, var value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key,value);
  }

}