import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final String text;
  final VoidCallback? onTap;
  const DefaultButton(
      {Key? key,
      this.color = const Color(0xFF5748FF),
      this.textColor = Colors.white,
      this.text = '',
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(9),
          ),
        ),
      ),
    );
  }
}
