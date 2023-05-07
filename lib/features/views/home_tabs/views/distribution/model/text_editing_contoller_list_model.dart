// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TextEditingContollerListModel extends Equatable {
  final List<TextEditingController> textEditingControllerList;
  const TextEditingContollerListModel({
    required this.textEditingControllerList,
  });

  @override
  List<Object?> get props => [textEditingControllerList];
}
