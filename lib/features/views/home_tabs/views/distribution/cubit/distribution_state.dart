part of 'distribution_cubit.dart';

class DistributionState extends Equatable {
  const DistributionState({
    this.currentPersonCount = 0,
    this.textEditingContollerListModel,
    this.personModel,
    this.copyText,
  });

  final int currentPersonCount;
  final TextEditingContollerListModel? textEditingContollerListModel;
  final PersonModel? personModel;

  final String? copyText;

  @override
  List<Object> get props => [
        currentPersonCount,
        textEditingContollerListModel ?? TextEditingContollerListModel,
        personModel ?? PersonModel,
        copyText ?? '',
      ];

  DistributionState copyWith({
    int? currentPersonCount,
    TextEditingContollerListModel? textEditingContollerListModel,
    PersonModel? personModel,
    String? copyText,
  }) {
    return DistributionState(
      currentPersonCount: currentPersonCount ?? this.currentPersonCount,
      textEditingContollerListModel:
          textEditingContollerListModel ?? this.textEditingContollerListModel,
      personModel: personModel ?? this.personModel,
      copyText: copyText ?? this.copyText,
    );
  }
}

class DistributionInitial extends DistributionState {}
