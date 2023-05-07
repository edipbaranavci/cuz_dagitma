part of 'raffle_cubit.dart';

class RaffleState extends Equatable {
  const RaffleState({
    this.checkRafflePersonListModel,
    this.rafflePersonListModel,
    this.selectedPersonName,
  });

  final PersonListModel? rafflePersonListModel;
  final PersonListModel? checkRafflePersonListModel;

  final String? selectedPersonName;

  @override
  List<Object> get props => [
        rafflePersonListModel ?? PersonListModel,
        checkRafflePersonListModel ?? PersonListModel,
        selectedPersonName ?? '',
      ];

  RaffleState copyWith({
    PersonListModel? rafflePersonListModel,
    PersonListModel? checkRafflePersonListModel,
    String? selectedPersonName,
  }) {
    return RaffleState(
      rafflePersonListModel:
          rafflePersonListModel ?? this.rafflePersonListModel,
      checkRafflePersonListModel:
          checkRafflePersonListModel ?? this.checkRafflePersonListModel,
      selectedPersonName: selectedPersonName ?? this.selectedPersonName,
    );
  }
}

class RaffleInitial extends RaffleState {}
