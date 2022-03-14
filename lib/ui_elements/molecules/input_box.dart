import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  final String? hint;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  const InputBox({
    Key? key,
    this.hint,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      controller: controller,
      maxLines: 8,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hint ?? 'Enter Here',
        fillColor: const Color(0xFFF0F0F0),
        filled: true,
      ),
      onChanged: onChanged,
      // controller: nameController
      //   ..text = _userProfileData.background, //this is your text
    );
  }
}
