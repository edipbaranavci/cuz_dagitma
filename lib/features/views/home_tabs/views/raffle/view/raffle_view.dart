import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/raffle_cubit.dart';

class RaffleView extends StatelessWidget {
  const RaffleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RaffleCubit>(
      create: (context) => RaffleCubit(),
      child: const _RaffleView(),
    );
  }
}

class _RaffleView extends StatelessWidget {
  const _RaffleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('RaffleView'),
      ],
    );
  }
}
