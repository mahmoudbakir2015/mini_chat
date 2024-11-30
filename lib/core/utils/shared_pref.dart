import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future putData({
    required bool value,
    required String key,
  }) async {
    return sharedPreferences!.setBool(
      key,
      value,
    );
  }

  static dynamic getData({
    required String key,
  }) async {
    return sharedPreferences?.get(
      key,
    );
  }

  static Future<bool?> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is int) {
      return await sharedPreferences?.setInt(key, value);
    }
    if (value is bool) {
      return await sharedPreferences?.setBool(key, value);
    }
    if (value is String) {
      return await sharedPreferences?.setString(key, value);
    }
    return await sharedPreferences?.setDouble(key, value);
  }

  static Future<bool?> removeData({
    required String key,
  }) async {
    return await sharedPreferences?.remove(key);
  }

  static Future<bool?> clearData({
    required String key,
  }) async {
    return await sharedPreferences?.clear();
  }

  static saveList(
      {required List<dynamic> list, required String listName}) async {
    String jsonList = jsonEncode(list);
    await sharedPreferences?.setString(listName, jsonList);
  }

  static Future<List<dynamic>> getList({required String listName}) async {
    String? jsonList = sharedPreferences?.getString(listName);
    if (jsonList != null) {
      List<dynamic> list = jsonDecode(jsonList);
      return list;
    }
    return []; // Return empty list if no data is found
  }
}
