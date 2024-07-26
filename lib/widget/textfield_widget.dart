import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tracking_web/config/theme/app_theme.dart';

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
  final InputBorder? border;
  final FocusNode? focusNode;
  final void Function()? onTap;
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
    this.border,
    this.focusNode,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: AppTextStyle.regular16(
        fontFamily: "SourceSansPro-Regular",
        color: Colors.black,
      ),
      focusNode: focusNode,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 12, left: 8),
          errorStyle: errorStyle,
          border: border ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
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
      onTap: onTap,
    );
  }
}
