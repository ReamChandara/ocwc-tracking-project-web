import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final TextStyle? errorStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  const TextFieldWidget({
    super.key,
    this.labelText,
    this.hintText,
    this.inputFormatters,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.onFieldSubmitted,
    this.validator,
    this.errorStyle,
    this.hintStyle,
    this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      scrollPadding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      controller: controller,
      style: const TextStyle(fontSize: 14),
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 8, left: 6),
          errorStyle: errorStyle,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: labelText,
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintStyle: hintStyle,
          labelStyle: labelStyle,
          fillColor: Colors.grey.shade200,
          filled: true),
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: inputFormatters,
    );
  }
}
