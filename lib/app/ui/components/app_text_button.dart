import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  AppTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor = Colors.blueAccent,
  });

  final VoidCallback onPressed;
  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            fixedSize: MaterialStateProperty.all<Size>(
                const Size(double.maxFinite, 40)),
            backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
        child: Text(text));
  }
}
