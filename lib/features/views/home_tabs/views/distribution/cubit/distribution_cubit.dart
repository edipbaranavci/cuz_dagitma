import 'dart:developer';

import 'package:cuz_dagitma/features/models/person/person_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../services/storage_service/shared_manager.dart';
import '../model/text_editing_contoller_list_model.dart';

part 'distribution_state.dart';

class DistributionCubit extends Cubit<DistributionState> {
  DistributionCubit() : super(DistributionInitial()) {
    _init();
  }

  final _sharedManager = SharedManager();

  Future<void> _init() async {
    await _getPersonValues();
  }

  Future<void> _getPersonValues() async {
    final map = await _sharedManager.getPersonValues();
    if (map.isNotEmpty) {
      List<TextEditingController> textEditingControllerList = [];
      for (var element in map.values) {
        textEditingControllerList.add(
          TextEditingController(text: element),
        );
      }
      emit(state.copyWith(
        textEditingContollerListModel: TextEditingContollerListModel(
          textEditingControllerList: textEditingControllerList,
        ),
        currentPersonCount: map.length,
        personModel: PersonModel(
          nameList: map.keys.toList(),
          valueList: map.values.toList(),
        ),
      ));
    }
  }
}
