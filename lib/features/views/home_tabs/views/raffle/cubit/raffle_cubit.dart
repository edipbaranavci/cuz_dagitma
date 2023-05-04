import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'raffle_state.dart';

class RaffleCubit extends Cubit<RaffleState> {
  RaffleCubit() : super(RaffleInitial());
}
