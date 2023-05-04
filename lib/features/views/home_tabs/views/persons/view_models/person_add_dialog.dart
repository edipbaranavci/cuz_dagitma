part of '../view/persons_view.dart';

class _PersonAddDialog extends StatelessWidget {
  const _PersonAddDialog();

  final String submitButtonTitle = 'Kaydet';
  final String title = 'Yeni Kişi';
  final String newPersonNameLabel = 'Kişinin İsmi....';

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PersonsCubit>();
    return CustomDialog(
      title: title,
      child: Form(
        key: cubit.newPersonFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            GeneralTextFormField(
              controller: cubit.newPersonController,
              labelText: newPersonNameLabel,
              validator: (value) => value?.defaultNameValidator,
            ),
            context.emptySizedHeightBoxLow3x,
            CustomElevatedTextButton(
              onPressed: () {
                if (cubit.newPersonFormKey.currentState!.validate()) {
                  cubit.addPerson().then((value) => context.pop());
                }
              },
              title: submitButtonTitle,
            )
          ],
        ),
      ),
    );
  }
}
