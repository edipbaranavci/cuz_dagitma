// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TextEditingContollerListModel extends Equatable {
  final List<TextEditingController> textEditingControllerList;
  TextEditingContollerListModel({
    required this.textEditingControllerList,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [textEditingControllerList];
}
