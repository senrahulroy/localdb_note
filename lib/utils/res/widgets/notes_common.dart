import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final Widget? icon;
  final String label;
  final String hint;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final bool borderFocus;
  final bool enabledBorder;
  final FormFieldValidator? validator;
  final ValueChanged<String>? onChanged;

  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    Key? key,
    this.icon,
    required this.label,
    required this.hint,
    this.focusNode,
    this.controller,
    this.borderFocus = true,
    this.enabledBorder = true,
    this.validator,
    this.onChanged,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: icon,
        labelText: label,
        hintText: hint,
        border: enabledBorder ? const OutlineInputBorder() : InputBorder.none,
        focusedBorder:
            borderFocus ? const OutlineInputBorder() : InputBorder.none,
      ),
    );
  }
}
