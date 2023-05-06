import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class GeneralTextFormField extends StatelessWidget {
  const GeneralTextFormField({
    this.labelText,
    this.controller,
    this.isEnabled = true,
    this.obscureText = false,
    this.enableInteractiveSelection,
    this.labelTextColor,
    this.keyboardType,
    this.hintText,
    this.suffixIcon,
    this.onChanged,
    this.maxLines,
    this.validator,
    this.hintTextColor,
    this.border,
    this.contentPadding,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool isEnabled;
  final bool? enableInteractiveSelection;
  final bool obscureText;
  final VoidCallback? onTap;

  final Color? hintTextColor;
  final Color? labelTextColor;

  final String? hintText;
  final String? labelText;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final int? maxLines;
  final String? Function(String? value)? validator;
  final InputBorder? border;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      enabled: isEnabled,
      onTap: onTap,
      maxLines: maxLines ?? 1,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText,
      onChanged: onChanged,
      enableInteractiveSelection: enableInteractiveSelection,
      style: context.textTheme.bodyLarge?.copyWith(
        color: labelTextColor ?? Colors.black,
      ),
      scrollPadding: EdgeInsets.zero,
      decoration: InputDecoration(
        contentPadding:
            contentPadding ?? const EdgeInsets.fromLTRB(12, 12, 12, 12),
        label: labelText == null ? null : buildLabel(context),
        hintText: hintText,
        hintStyle: context.textTheme.bodyMedium?.copyWith(
          color: hintTextColor ?? context.colorScheme.secondary,
        ),
        suffixIcon: suffixIcon,
        border: border ?? _inputBorder,
        errorStyle: context.textTheme.labelSmall?.copyWith(
          color: Colors.red,
        ),
        enabledBorder: border ?? _inputBorder,
        disabledBorder: border ?? _inputBorder,
        focusedBorder: border ?? _inputBorder,
      ),
    );
  }

  Text buildLabel(BuildContext context) {
    return Text(
      labelText ?? '',
      style: context.textTheme.bodyLarge?.copyWith(
        color: labelTextColor ?? Colors.black,
      ),
    );
  }

  InputBorder get _inputBorder {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1.5,
      ),
    );
  }
}
