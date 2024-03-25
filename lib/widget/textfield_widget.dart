import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final TextStyle? errorStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  const TextFieldWidget(
      {super.key,
      required this.labelText,
      this.hintText,
      this.inputFormatters,
      required this.controller,
      this.suffixIcon,
      this.onFieldSubmitted,
      this.validator,
      this.errorStyle,
      this.hintStyle,
      this.labelStyle});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          errorStyle: errorStyle,
          border: const OutlineInputBorder(),
          labelText: labelText,
          hintText: hintText,
          suffixIcon: suffixIcon,
          hintStyle: hintStyle,
          labelStyle: labelStyle),
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: inputFormatters,
    );
  }
}
