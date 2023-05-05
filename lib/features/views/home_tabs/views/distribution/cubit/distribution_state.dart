part of 'distribution_cubit.dart';

class DistributionState extends Equatable {
  const DistributionState({
    this.currentPersonCount = 0,
    this.textEditingContollerListModel,
    this.personModel,
  });

  final int currentPersonCount;
  final TextEditingContollerListModel? textEditingContollerListModel;
  final PersonModel? personModel;

  @override
  List<Object> get props => [
        currentPersonCount,
        textEditingContollerListModel ?? TextEditingContollerListModel,
        personModel ?? PersonModel,
      ];

  DistributionState copyWith({
    int? currentPersonCount,
    TextEditingContollerListModel? textEditingContollerListModel,
    PersonModel? personModel,
  }) {
    return DistributionState(
      currentPersonCount: currentPersonCount ?? this.currentPersonCount,
      textEditingContollerListModel:
          textEditingContollerListModel ?? this.textEditingContollerListModel,
      personModel: personModel ?? this.personModel,
    );
  }
}

class DistributionInitial extends DistributionState {}
