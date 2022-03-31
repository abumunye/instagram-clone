import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool isPass;
  final TextInputType textInputType;

  const TextInput(
      {Key? key,
      required this.hint,
      required this.controller,
      this.isPass = false,
      required this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));

    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: const EdgeInsets.all(8),
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
      ),
      controller: controller,
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
