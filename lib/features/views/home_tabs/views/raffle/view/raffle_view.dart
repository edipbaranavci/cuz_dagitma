import 'package:cuz_dagitma/core/components/button/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../../../../../../core/components/button/custom_elevated_text_button.dart';
import '../../../../../../core/components/dialog/custom_dialog.dart';
import '../cubit/raffle_cubit.dart';

part '../view_models/raffle_dialog.dart';
part '../view_models/raffle_reset_dialog.dart';

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
  final String raffleButtonTitle = 'Kura Çek';
  final String resetButtonTitle = 'Sıfırla';

  final String emptyCheckRaffleTitle = 'Henüz kimse seçilmedi!';
  final String emptyRaffleTitle = 'Kimse kalmadı, Sıfırla butonuna basınız.';

  final String notRafflePesonsTitle = 'Kuraya Çıkmayanlar';
  final String rafflePesonsTitle = 'Kuraya Çıkanlar';
  final String peopleTitle = 'kişi';

  void openRaffleDialog(BuildContext contextt) {
    showDialog(
      context: contextt,
      builder: (context) => BlocProvider<RaffleCubit>.value(
        value: contextt.read<RaffleCubit>(),
        child: const _RaffleDialog(),
      ),
    );
  }

  Future<void> openRaffleResetDialog(BuildContext contextt) async {
    final cubit = contextt.read<RaffleCubit>();
    final control = await showDialog<bool>(
      context: contextt,
      builder: (context) => BlocProvider<RaffleCubit>.value(
        value: cubit,
        child: const _RaffleResetDialog(),
      ),
    );
    if (control == true) {
      cubit.resetRafflePersons();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RaffleCubit>();
    return Scaffold(
      key: cubit.scaffoldKey,
      body: Padding(
        padding: context.paddingLow,
        child: BlocBuilder<RaffleCubit, RaffleState>(
          builder: (context, state) {
            final raffleList = state.rafflePersonListModel?.personList ?? [];
            final checkRaffleList =
                state.checkRafflePersonListModel?.personList ?? [];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    '$notRafflePesonsTitle (${raffleList.length} $peopleTitle)',
                    style: context.textTheme.headlineSmall,
                  ),
                ),
                buildRaffleListViewBuilder(context, raffleList),
                buildDivider(context),
                Center(
                  child: Text(
                    '$rafflePesonsTitle (${checkRaffleList.length} $peopleTitle)',
                    style: context.textTheme.headlineSmall,
                  ),
                ),
                buildCheckRaffleListViewBuilder(
                  context,
                  checkRaffleList,
                ),
                Row(
                  children: [
                    CustomElevatedTextButton(
                      onPressed: () => openRaffleResetDialog(context),
                      title: resetButtonTitle,
                    ),
                    context.emptySizedWidthBoxLow3x,
                    Expanded(
                      child: CustomElevatedTextButton(
                        onPressed: () {
                          cubit.rafflePerson();
                          openRaffleDialog(context);
                        },
                        title: raffleButtonTitle,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  SizedBox buildDivider(BuildContext context) {
    return SizedBox(
      width: context.width * 0.9,
      child: const Divider(thickness: 1),
    );
  }

  Widget buildRaffleListViewBuilder(
    BuildContext context,
    List<String> raffleList,
  ) {
    if (raffleList.isEmpty) {
      return Center(
        child: Card(child: ListTile(title: Text(emptyRaffleTitle))),
      );
    } else {
      return Expanded(
        child: ListView.builder(
          itemCount: raffleList.length,
          itemBuilder: (context, index) =>
              buildRaffleListTile(raffleList[index]),
        ),
      );
    }
  }

  Widget buildCheckRaffleListViewBuilder(
    BuildContext context,
    List<String> checkRaffleList,
  ) {
    if (checkRaffleList.isEmpty) {
      return Center(
        child: Card(child: ListTile(title: Text(emptyCheckRaffleTitle))),
      );
    } else {
      return Expanded(
        child: ListView.builder(
          itemCount: checkRaffleList.length,
          itemBuilder: (context, index) =>
              buildCheckRaffleListTile(checkRaffleList[index]),
        ),
      );
    }
  }

  Widget buildRaffleListTile(String title) {
    return Card(child: ListTile(title: Text(title)));
  }

  Widget buildCheckRaffleListTile(String title) {
    return Card(
      color: Colors.grey,
      child: Builder(
        builder: (context) {
          return ListTile(
            title: Text(
              title,
              style: context.textTheme.bodyMedium?.copyWith(
                decoration: TextDecoration.lineThrough,
              ),
            ),
            trailing: CustomIconButton(
              iconData: Icons.delete,
              toolTip: 'Geri Sil',
              onTap: () =>
                  context.read<RaffleCubit>().removeCheckRafflePerson(title),
            ),
          );
        },
      ),
    );
  }
}
