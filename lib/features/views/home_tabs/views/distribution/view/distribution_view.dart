import '../cubit/distribution_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DistributionView extends StatelessWidget {
  const DistributionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DistributionCubit>(
      create: (context) => DistributionCubit(),
      child: const _DistributionView(),
    );
  }
}

class _DistributionView extends StatelessWidget {
  const _DistributionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('DistributionView'),
      ],
    );
  }
}
