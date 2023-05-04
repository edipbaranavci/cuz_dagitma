import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'distribution_state.dart';

class DistributionCubit extends Cubit<DistributionState> {
  DistributionCubit() : super(DistributionInitial());
}
