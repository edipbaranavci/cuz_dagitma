import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/extensions/scaffold_messenger/snack_bar.dart';
import '../../../../../models/person/person_list_model.dart';
import '../../../../../services/storage_service/shared_manager.dart';

part 'persons_state.dart';

class PersonsCubit extends Cubit<PersonsState> {
  PersonsCubit() : super(PersonsInitial()) {
    _init();
  }

  final newPersonController = TextEditingController();
  final newPersonFormKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final _sharedManager = SharedManager();

  final String addedPersonMessage = 'Yeni Kişi Eklendi';
  final String deletedPersonMessage = 'silindi!';

  Future<void> _init() async {
    await _getPersonList();
  }

  Future<void> _getPersonList() async {
    final personList = await _sharedManager.getPresonList();
    emit(state.copyWith(
        personListModel: PersonListModel(personList: personList)));
  }

  Future<void> removePerson(int index) async {
    final personList = state.personListModel?.personList ?? [];
    final name = personList[index];
    personList.removeAt(index);
    await _sharedManager.setPersonList(personList);
    await _removePersonValues(name);
    await _getPersonList();
    scaffoldKey.showGreatSnackBar('$name $deletedPersonMessage');
    return;
  }

  Future<void> _removePersonValues(String name) async {
    final map = await _sharedManager.getPersonValues();
    bool control = false;
    map.forEach((key, value) {
      if (key == name) {
        control = true;
      }
    });
    if (control == true) {
      map.remove(name);
      await _sharedManager.setPersonValues(map);
      final raffleList = await _sharedManager.getRaffleList();
      final checkRaffleList = await _sharedManager.getCheckRaffleList();
      if (raffleList.contains(name)) {
        raffleList.remove(name);
        await _sharedManager.setRaffleList(raffleList);
      } else if (checkRaffleList.contains(name)) {
        checkRaffleList.remove(name);
        await _sharedManager.setCheckRaffleList(checkRaffleList);
      }
    }
  }

  Future<bool> addPerson() async {
    scaffoldKey.showLoadingBar();
    final personList = state.personListModel?.personList ?? [];
    final control = personList.contains(newPersonController.text);
    if (control == false) {
      personList.add(newPersonController.text);
      final map = await _sharedManager.getPersonValues();
      map[newPersonController.text] = '4. - 5.';
      final raffleList = await _sharedManager.getRaffleList();
      raffleList.add(newPersonController.text);
      await _sharedManager.setRaffleList(raffleList);
      await _sharedManager.setPersonValues(map);
      await _sharedManager.setPersonList(personList);
      await _getPersonList();
      scaffoldKey.showGreatSnackBar(addedPersonMessage);
      newPersonController.clear();
    }
    return control;
  }
}
