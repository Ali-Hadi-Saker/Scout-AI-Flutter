import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback onPressed;
  const SmallButton({super.key, required this.color, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        ),
        color: color,
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}
