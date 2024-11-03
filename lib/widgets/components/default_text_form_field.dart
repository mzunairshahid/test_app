import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? validator;
  final Function(String)? onChanged;
  const DefaultTextFormField({
    super.key,
    required this.controller,
    this.onChanged,
    this.validator,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: (value) => validator,
      onChanged: onChanged,
      decoration: InputDecoration(hintText: hintText),
    );
  }
}
