import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../button/custom_icon_button.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    this.iconPadding,
    this.insetPadding,
    this.titlePadding,
    this.buttonPadding,
    this.actionsPadding,
    this.contentPadding,
    this.title,
    this.actions,
    required this.child,
    this.backgroundColor,
  });
  final EdgeInsets? iconPadding;
  final EdgeInsets? insetPadding;
  final EdgeInsets? titlePadding;
  final EdgeInsets? buttonPadding;
  final EdgeInsets? actionsPadding;
  final EdgeInsets? contentPadding;
  final Widget child;
  final String? title;
  final List<Widget>? actions;
  final Color? backgroundColor;

  final String closeButtonToolMessage = 'Kapat';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor ?? Colors.white,
      iconPadding: iconPadding ?? EdgeInsets.zero,
      insetPadding: insetPadding ?? EdgeInsets.zero,
      titlePadding: titlePadding ?? context.paddingLow,
      buttonPadding: buttonPadding ?? EdgeInsets.zero,
      actionsPadding: actionsPadding ?? EdgeInsets.zero,
      contentPadding: contentPadding ?? context.paddingLow,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CustomIconButton(
            iconData: Icons.close,
            color: Colors.transparent,
            onTap: null,
          ),
          Text(
            title ?? '',
            style: context.textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          CustomIconButton(
            iconData: Icons.close,
            toolTip: closeButtonToolMessage,
            color: Colors.black,
            onTap: () => context.pop(),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: context.lowBorderRadius,
        side: const BorderSide(color: Colors.grey),
      ),
      actions: actions,
      content: SizedBox(
        width: context.width * .9,
        child: child,
      ),
    );
  }
}
