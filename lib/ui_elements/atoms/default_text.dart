import 'package:flutter/material.dart';

class DefaultText extends StatelessWidget {
  final String data;

  const DefaultText(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(
        fontSize: 24,
        color: Colors.black,
      ),
    );
  }
}
