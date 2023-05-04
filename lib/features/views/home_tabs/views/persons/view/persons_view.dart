import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../../../../../../core/components/button/custom_elevated_text_button.dart';
import '../../../../../../core/components/button/custom_icon_button.dart';
import '../../../../../../core/components/dialog/custom_dialog.dart';
import '../../../../../../core/components/text_field/general_text_form_field.dart';
import '../../../../../../core/extensions/string/string_extension.dart';
import '../cubit/persons_cubit.dart';

part '../view_models/person_add_dialog.dart';

class PersonsView extends StatelessWidget {
  const PersonsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PersonsCubit>(
      create: (context) => PersonsCubit(),
      child: const _PersonsView(),
    );
  }
}

class _PersonsView extends StatelessWidget {
  const _PersonsView({Key? key}) : super(key: key);

  void openAddPersonDialog(BuildContext context) {
    final cubit = context.read<PersonsCubit>();
    showDialog(
      context: context,
      builder: (context) => BlocProvider<PersonsCubit>.value(
        value: cubit,
        child: const _PersonAddDialog(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PersonsCubit>();
    return Scaffold(
      key: cubit.scaffoldKey,
      floatingActionButton: buildFAB(context),
      body: buildContent(context),
    );
  }

  FloatingActionButton buildFAB(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => openAddPersonDialog(context),
      child: const Icon(Icons.add),
    );
  }

  Widget buildContent(BuildContext context) {
    return BlocBuilder<PersonsCubit, PersonsState>(
      builder: (context, state) {
        final personList = state.personListModel?.personList ?? [];
        if (personList.isEmpty) {
          return Center(
            child: Card(
              child: Padding(
                padding: context.paddingNormal,
                child: const Text('Henüz Kimseyi Eklemediniz!'),
              ),
            ),
          );
        } else {
          return ListView.builder(
            itemCount: personList.length,
            itemBuilder: (context, index) {
              return buildCard(personList[index], index);
            },
          );
        }
      },
    );
  }

  Widget buildCard(String title, int index) {
    return Builder(builder: (context) {
      return Card(
        child: ListTile(
          title: Text(title),
          trailing: CustomIconButton(
            iconData: Icons.delete,
            toolTip: 'Sil',
            onTap: () => context.read<PersonsCubit>().removePerson(index),
          ),
        ),
      );
    });
  }
}
