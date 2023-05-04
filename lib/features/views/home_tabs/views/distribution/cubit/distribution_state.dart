part of 'distribution_cubit.dart';

abstract class DistributionState extends Equatable {
  const DistributionState();

  @override
  List<Object> get props => [];
}

class DistributionInitial extends DistributionState {}
