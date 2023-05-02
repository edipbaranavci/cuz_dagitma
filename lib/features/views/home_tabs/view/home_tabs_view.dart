import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/home_tabs_cubit.dart';

class HomeTabsView extends StatelessWidget {
  const HomeTabsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeTabsCubit>(
      create: (context) => HomeTabsCubit(),
      child: const _HomeTabsView(),
    );
  }
}

class _HomeTabsView extends StatelessWidget {
  const _HomeTabsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Text('HomeTabsView'),
        ],
      ),
    );
  }
}
