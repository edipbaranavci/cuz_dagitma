import 'dart:convert';
import 'dart:developer';

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
    return pref.getStringList(_Enums.raffleList.name) ?? await getPresonList();
  }

  Future<bool> setCheckRaffleList(List<String> checkRaffleList) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setStringList(_Enums.checkRaffleList.name, checkRaffleList);
  }

  Future<List<String>> getCheckRaffleList() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getStringList(_Enums.checkRaffleList.name) ?? [];
  }

  Future<bool> setPersonValues(Map<String, dynamic> personValues) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setString(_Enums.presonValues.name, json.encode(personValues));
  }

  Future<Map<String, dynamic>> getPersonValues() async {
    final pref = await SharedPreferences.getInstance();
    try {
      final map = pref.getString(_Enums.presonValues.name);
      if (map is String) {
        return json.decode(map) as Map<String, dynamic>;
      } else {
        return {};
      }
    } catch (e) {
      log('$e');
      return {};
    }
  }
}

enum _Enums {
  personList,
  raffleList,
  checkRaffleList,
  presonValues,
}
