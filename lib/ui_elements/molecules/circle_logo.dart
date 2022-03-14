import 'package:flutter/material.dart';
import 'package:todo/ui_elements/atoms/default_text.dart';

class MediumCircle extends StatelessWidget {
  final String label;

  const MediumCircle({Key? key, this.label = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.black26),
      child: Center(child: DefaultText(label)),
    );
  }
}
