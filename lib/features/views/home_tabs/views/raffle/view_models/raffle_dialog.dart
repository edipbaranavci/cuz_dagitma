part of '../view/raffle_view.dart';

class _RaffleDialog extends StatelessWidget {
  const _RaffleDialog();
  final String title = 'Kurada Çekilen Kişi';
  final String submitButtonTitle = 'Onaylıyorum';
  final String cancelButtonTitle = 'Kapat';

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
        title: title,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            context.emptySizedHeightBoxLow3x,
            BlocBuilder<RaffleCubit, RaffleState>(
              builder: (context, state) {
                return Text(
                  state.selectedPersonName ?? '',
                  style: context.textTheme.titleLarge,
                );
              },
            ),
            context.emptySizedHeightBoxLow3x,
            buildBottomButtons(context),
          ],
        ));
  }

  Row buildBottomButtons(BuildContext context) {
    final cubit = context.read<RaffleCubit>();
    return Row(
      children: [
        Expanded(
          child: CustomElevatedTextButton(
            onPressed: () => context.pop(),
            title: cancelButtonTitle,
            backgroundColor: Colors.red,
          ),
        ),
        context.emptySizedWidthBoxLow3x,
        Expanded(
          child: CustomElevatedTextButton(
            onPressed: () =>
                cubit.acceptSelectedPerson().whenComplete(() => context.pop()),
            title: submitButtonTitle,
          ),
        ),
      ],
    );
  }
}
