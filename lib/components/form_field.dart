import 'package:flutter/material.dart';

class FormFieldCustom extends StatelessWidget {
  const FormFieldCustom({
    Key? key,
    this.controller,
    this.obscureText = false,
    this.validator,
    this.autovalidateMode,
    required this.labelText,
    this.suffix,
  }) : super(key: key);

  final TextEditingController? controller;
  final String labelText;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autovalidateMode;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: labelText,
        enabledBorder: const UnderlineInputBorder(),
        focusedBorder: const UnderlineInputBorder(),
        border: const UnderlineInputBorder(),
        suffixIcon: suffix,
      ),
      obscureText: obscureText,
      autovalidateMode: autovalidateMode,
      validator: validator,
    );
  }
}
