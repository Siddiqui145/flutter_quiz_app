import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const OptionButton({
    super.key,
    required this.text,
    required this.onPressed,
    });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: 12
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        ),
      ),
    onPressed: onPressed,
     child: Text(text,
     style: 
      Theme.of(context).textTheme.titleSmall
     ),);
  }
}