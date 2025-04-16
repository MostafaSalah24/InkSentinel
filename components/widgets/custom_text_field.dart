import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String placeholder;
  final TextEditingController controller;
  final TextInputType? keyboardType;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.placeholder,
    required this.controller,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xff1B225B),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5),
        CupertinoTextField(
          cursorColor: const Color(0xff1B225B),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          placeholder: placeholder,
          placeholderStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          keyboardType: keyboardType ?? TextInputType.text,
          controller: controller,
          style: const TextStyle(fontSize: 16, color: Color(0xff1B225B)),
        ),
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: controller,
          builder: (context, value, child) {
            return value.text.isEmpty
                ? const Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      'This field cannot be empty',
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  )
                : const SizedBox.shrink();
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
