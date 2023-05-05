import 'package:cuz_dagitma/core/components/text_field/general_text_form_field.dart';
import 'package:kartal/kartal.dart';

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

  final String emptyPersonTitle = 'Henüz Kimseyi Eklemediniz!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DistributionCubit, DistributionState>(
        builder: (context, state) {
          if (state.personModel == null) {
            return buildEmptyCard(context);
          } else {
            return ListView.builder(
              padding: context.paddingLow,
              itemCount: state.textEditingContollerListModel
                      ?.textEditingControllerList.length ??
                  0,
              itemBuilder: (context, index) {
                final name = state.personModel?.nameList[index] ?? '';
                final value = state.personModel?.valueList[index] ?? '';
                final controller = state.textEditingContollerListModel
                    ?.textEditingControllerList[index];
                return Padding(
                  padding: context.verticalPaddingLow * 0.5,
                  child: Row(children: [
                    Expanded(flex: 3, child: Text(name)),
                    Expanded(
                      flex: 6,
                      child: GeneralTextFormField(
                        controller: controller,
                        hintText: value,
                      ),
                    ),
                  ]),
                );
              },
            );
          }
        },
      ),
    );
  }

  Center buildEmptyCard(BuildContext context) {
    return Center(
      child: Card(
        color: context.colorScheme.primary,
        child: Padding(
          padding: context.paddingNormal,
          child: Text(
            emptyPersonTitle,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
