import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String placeholder;
  final bool isPassword;
  final IconData suffixIcon;
  final VoidCallback? onToggleVisibility;

  const CustomInputField({
    super.key,
    required this.label,
    required this.controller,
    required this.placeholder,
    required this.isPassword,
    required this.suffixIcon,
    this.onToggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        CupertinoTextField(
          controller: controller,
          obscureText: isPassword,
          placeholder: placeholder,
          suffix: onToggleVisibility != null
              ? IconButton(icon: Icon(suffixIcon), onPressed: onToggleVisibility)
              : Icon(suffixIcon),
        ),
      ],
    );
  }
}
