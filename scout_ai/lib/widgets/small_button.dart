import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  final LinearGradient? gradient;
  final Color? btnColor;
  final String text;
  final VoidCallback onPressed;
  final bool isFullWidth;

  const SmallButton({
    super.key,
    this.gradient,
    required this.onPressed,
    required this.text,
    this.isFullWidth = false,
    this.btnColor
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          // gradient: gradient,
          color: btnColor
        ),
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          onPressed: onPressed,
          padding: const EdgeInsets.all(15),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 20),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}
