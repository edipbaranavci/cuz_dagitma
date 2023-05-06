import 'package:cuz_dagitma/core/components/button/custom_elevated_text_button.dart';
import 'package:cuz_dagitma/core/components/dialog/custom_dialog.dart';
import 'package:cuz_dagitma/core/components/text_field/general_text_form_field.dart';
import 'package:cuz_dagitma/core/extensions/string/string_extension.dart';
import 'package:kartal/kartal.dart';

import '../cubit/distribution_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../view_models/dialog.dart';

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
  final String submitButtonTitle = 'Cüzleri Dağıt';

  void openDialog(BuildContext contextt) {
    showDialog(
      context: contextt,
      builder: (context) => BlocProvider<DistributionCubit>.value(
        value: contextt.read<DistributionCubit>(),
        child: const _Dialog(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DistributionCubit>();
    return Scaffold(
      key: cubit.scaffoldKey,
      body: Padding(
        padding: context.paddingLow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BlocBuilder<DistributionCubit, DistributionState>(
              builder: (context, state) {
                if (state.personModel == null) {
                  return buildEmptyCard(context);
                } else {
                  return Expanded(
                    flex: 8,
                    child: Form(
                      key: cubit.formKey,
                      child: ListView.builder(
                        itemCount: state.textEditingContollerListModel
                                ?.textEditingControllerList.length ??
                            0,
                        itemBuilder: (context, index) {
                          final name = state.personModel?.nameList[index] ?? '';
                          final value =
                              state.personModel?.valueList[index].toString() ??
                                  '';
                          final controller = state.textEditingContollerListModel
                              ?.textEditingControllerList[index];
                          return Padding(
                            padding: context.verticalPaddingLow * 0.5,
                            child: Row(
                              children: [
                                Expanded(flex: 7, child: Text(name)),
                                Expanded(
                                  flex: 4,
                                  child: GeneralTextFormField(
                                    controller: controller,
                                    hintText: value,
                                    validator: (value) =>
                                        value.defaultEmptyValidator,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
              },
            ),
            CustomElevatedTextButton(
              onPressed: () {
                if (cubit.formKey.currentState!.validate()) {
                  context.read<DistributionCubit>().personDistribute();
                  openDialog(context);
                }
              },
              title: submitButtonTitle,
            ),
            context.emptySizedHeightBoxLow3x,
          ],
        ),
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
