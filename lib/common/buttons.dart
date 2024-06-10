import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.color,
      required this.textColor});
  final String text;
  final void Function()? onPressed;
  final Color? color;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      padding: const EdgeInsets.all(0.0),
      child: Ink(
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)),
        child: Container(
          constraints: const BoxConstraints(
            minHeight: 61,
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
