import 'dart:math' as math show Random;
import 'package:cuz_dagitma/core/extensions/scaffold_messenger/snack_bar.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../models/person/person_list_model.dart';
import '../../../../../services/storage_service/shared_manager.dart';

part 'raffle_state.dart';

class RaffleCubit extends Cubit<RaffleState> {
  RaffleCubit() : super(RaffleInitial()) {
    _init();
  }

  final _sharedManager = SharedManager();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final String resetRaffleListsMessage = 'Kura listeleri sıfırlandı!';

  Future<void> _init() async {
    await _getRafflePersonList();
  }

  int get randomIndex => math.Random()
      .nextInt(state.rafflePersonListModel?.personList?.length ?? 0);

  Future<void> removeCheckRafflePerson(String name) async {
    final raffleList = await _sharedManager.getRaffleList();
    final checkRaffleList = await _sharedManager.getCheckRaffleList();
    checkRaffleList.remove(name);
    raffleList.insert(0, name);
    await _sharedManager.setCheckRaffleList(checkRaffleList);
    await _sharedManager.setRaffleList(raffleList);
    await _init();
  }

  void rafflePerson() {
    final list = state.rafflePersonListModel?.personList ?? [];
    final person = list[randomIndex];
    emit(state.copyWith(selectedPersonName: person));
  }

  Future<void> resetRafflePersons() async {
    final personList = await _sharedManager.getPresonList();
    await _sharedManager.setRaffleList(personList);
    await _sharedManager.setCheckRaffleList([]);
    await _init();
    scaffoldKey.showGreatSnackBar(resetRaffleListsMessage);
    return;
  }

  Future<void> acceptSelectedPerson() async {
    final raffleList = state.rafflePersonListModel?.personList ?? [];
    raffleList.remove(state.selectedPersonName);
    final checkRaffleList = state.checkRafflePersonListModel?.personList ?? [];
    checkRaffleList.add(state.selectedPersonName ?? '');
    await _sharedManager.setRaffleList(raffleList);
    await _sharedManager.setCheckRaffleList(checkRaffleList);
    await _init();
    emit(state.copyWith(selectedPersonName: ''));
    return;
  }

  Future<void> _getRafflePersonList() async {
    final raffleList = await _sharedManager.getRaffleList();
    final checkRaffleList = await _sharedManager.getCheckRaffleList();
    emit(state.copyWith(
      rafflePersonListModel: PersonListModel(personList: raffleList),
      checkRafflePersonListModel: PersonListModel(personList: checkRaffleList),
    ));
  }
}
