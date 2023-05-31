part of '../view/persons_view.dart';

class _PersonAvailableDialog extends StatelessWidget {
  const _PersonAvailableDialog({super.key});

  final String title = 'Kişi Mevcut';
  final String message =
      'Lütfen farklı bir isim giriniz veya öncekini siliniz!';
  final String closeButtonTitle = 'Kapat';

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: title,
      actions: [
        CustomElevatedTextButton(
          onPressed: () => context.pop(),
          title: closeButtonTitle,
        ),
      ],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [Text(message)],
      ),
    );
  }
}
