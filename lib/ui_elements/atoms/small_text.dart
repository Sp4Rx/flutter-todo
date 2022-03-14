import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String data;
  const SmallText(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(
        fontSize: 14,
        color: Color(0xFF6D6D6D),
      ),
    );
  }
}
