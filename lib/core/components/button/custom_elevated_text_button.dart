import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomElevatedTextButton extends StatelessWidget {
  const CustomElevatedTextButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.backgroundColor,
    this.padding,
    this.margin,
    this.textColor,
    this.elevation = 0,
    this.borderSide = BorderSide.none,
    this.style,
    this.borderRadius,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String title;
  final Color? backgroundColor;
  final Color? textColor;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double elevation;
  final BorderSide borderSide;
  final TextStyle? style;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: padding ?? context.horizontalPaddingMedium,
          backgroundColor: backgroundColor ?? context.appTheme.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? context.lowBorderRadius,
            side: borderSide,
          ),
          elevation: elevation,
        ),
        child: Text(
          title,
          style: style ??
              context.textTheme.labelLarge?.copyWith(
                color: textColor ?? context.colorScheme.onPrimary,
              ),
        ),
      ),
    );
  }
}
