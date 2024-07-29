import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UtilHelper {
  String key = "TODO-LIST";
  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    var val;
    try {
      val = prefs.getString(key);
    } catch (e) {}
    return json.decode(val);
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
