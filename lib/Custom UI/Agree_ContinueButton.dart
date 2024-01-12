import 'package:flutter/material.dart';

class AgreeContinueButton extends StatelessWidget {
  final double? buttonWidth;
  final VoidCallback onPressed;
  final String text;
  final double? mright;

  const AgreeContinueButton({
    Key? key, // Fix: Use Key? instead of super.key
    this.buttonWidth,
    required this.onPressed,
    required this.text,
    required this.mright,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mright ?? 0.0, vertical: 10),
        child: Text(text, textAlign: TextAlign.center),
      ),
    );
  }
}
