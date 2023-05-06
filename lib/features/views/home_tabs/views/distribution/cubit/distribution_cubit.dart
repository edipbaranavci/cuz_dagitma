import 'package:cuz_dagitma/core/extensions/scaffold_messenger/snack_bar.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../models/person/person_model.dart';
import '../../../../../services/storage_service/shared_manager.dart';
import '../model/text_editing_contoller_list_model.dart';

part 'distribution_state.dart';

class DistributionCubit extends Cubit<DistributionState> {
  DistributionCubit() : super(DistributionInitial()) {
    _init();
  }

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final _sharedManager = SharedManager();

  final String copieingTextMessage = 'Mesaj Kopyalandı!';

  Future<void> _init() async {
    await _getPersonValues();
  }

  Future<void> _getPersonValues() async {
    final map = await _sharedManager.getPersonValues();
    if (map.isNotEmpty) {
      List<TextEditingController> textEditingControllerList = [];
      for (var element in map.values) {
        textEditingControllerList.add(TextEditingController());
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

  Future<void> copyTextCopy() async {
    Map<String, dynamic> personValues = <String, dynamic>{};
    final nameList = state.personModel?.nameList ?? [];
    final controllerList =
        state.textEditingContollerListModel?.textEditingControllerList ?? [];
    for (var i = 0; i < nameList.length; i++) {
      personValues[nameList[i]] = controllerList[i].text;
    }
    final control = await _sharedManager.setPersonValues(personValues);
    if (control == true) {
      await Clipboard.setData(ClipboardData(text: state.copyText));
      scaffoldKey.showGreatSnackBar(copieingTextMessage);
      return;
    }
  }

  void personDistribute() {
    String copyText = '';
    final nameList = state.personModel?.nameList;
    final controllerList =
        state.textEditingContollerListModel?.textEditingControllerList;
    for (var i = 0; i < (nameList?.length ?? 0); i++) {
      copyText += '${nameList?[i]}: ${controllerList?[i].text} Cüz\n';
    }
    emit(state.copyWith(copyText: copyText));
  }
}
