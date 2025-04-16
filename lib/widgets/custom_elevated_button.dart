import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    this.buttonWidth,
    required this.onPressed,
    required this.text,
    this.mright = 0,
  }) : super(key: key);

  final double? buttonWidth;
  final VoidCallback onPressed;
  final String text;
  final double? mright;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: buttonWidth ?? MediaQuery.of(context).size.width - 10,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: mright!, vertical: 10),
          child: Text(text),
        ),
      ),
    );
  }
}