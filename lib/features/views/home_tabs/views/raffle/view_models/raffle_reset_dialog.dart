part of '../view/raffle_view.dart';

class _RaffleResetDialog extends StatelessWidget {
  const _RaffleResetDialog();

  final String message = 'Kura listeleri tamamen sıfırlansın mı?';
  final String title = 'Kura Sıfırlama';

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      actions: [
        CustomElevatedTextButton(
          onPressed: () => context.pop<bool>(false),
          backgroundColor: Colors.red,
          title: 'Hayır',
        ),
        CustomElevatedTextButton(
          onPressed: () => context.pop<bool>(true),
          backgroundColor: Colors.green,
          title: 'Evet',
        ),
      ],
      title: title,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [Text(message)],
      ),
    );
  }
}
