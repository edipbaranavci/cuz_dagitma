import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_tabs_state.dart';

class HomeTabsCubit extends Cubit<HomeTabsState> {
  HomeTabsCubit() : super(HomeTabsInitial());
}
