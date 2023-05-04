// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'persons_cubit.dart';

class PersonsState extends Equatable {
  const PersonsState({this.personListModel});

  final PersonListModel? personListModel;

  @override
  List<Object> get props => [personListModel ?? PersonListModel];

  PersonsState copyWith({
    PersonListModel? personListModel,
  }) {
    return PersonsState(
      personListModel: personListModel ?? this.personListModel,
    );
  }
}

class PersonsInitial extends PersonsState {}
