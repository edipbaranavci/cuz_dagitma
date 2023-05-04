import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedManager {
  Future<bool> setPersonList(List<String> personList) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setStringList(_Enums.personList.name, personList);
  }

  Future<List<String>> getPresonList() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getStringList(_Enums.personList.name) ?? [];
  }

  Future<bool> setRaffleList(List<String> raffleList) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setStringList(_Enums.raffleList.name, raffleList);
  }

  Future<List<String>> getRaffleList() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getStringList(_Enums.raffleList.name) ?? [];
  }

  Future<bool> setPersonValues(Map<String, dynamic> personValues) async {
    final pref = await SharedPreferences.getInstance();

    return pref.setString(_Enums.presonValues.name, json.encode(personValues));
  }

  Future<Map<String, dynamic>?> getPersonValue() async {
    final pref = await SharedPreferences.getInstance();
    try {
      final map = pref.getString(_Enums.presonValues.name);
      return json.decode(map ?? '');
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return null;
    }
  }
}

enum _Enums {
  personList,
  raffleList,
  presonValues,
}
