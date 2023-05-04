import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final TextStyle? textStyle;
  final Color? textColor;
  final EdgeInsets? padding;
  const CustomTextButton(
    this.title, {
    required this.onTap,
    Key? key,
    this.textColor,
    this.textStyle,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: context.lowBorderRadius * .5,
      onTap: onTap,
      child: Padding(
        padding: padding ?? context.paddingLow,
        child: Text(
          title,
          style: textStyle ??
              context.textTheme.labelLarge?.copyWith(color: textColor),
        ),
      ),
    );
  }
}
