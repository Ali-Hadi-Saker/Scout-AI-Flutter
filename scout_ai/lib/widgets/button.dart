import 'package:flutter/material.dart';

class CustomizedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Icon? preffixIcon;
  final Icon? suffexIcon;
  final LinearGradient? gradient;
  final Color? btnColor;

  const CustomizedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.suffexIcon,
    this.height,
    this.preffixIcon,
    this.gradient,
    this.btnColor
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: btnColor,
        ),
        child: MaterialButton(
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              // Prefix Icon (left)
              if (preffixIcon != null) ...[
                Icon(
                  preffixIcon!.icon,
                  size: 24,
                  color: Colors.white,
                ),
                const SizedBox(width: 8), // Space between icon and text
              ],
              const SizedBox(width: 10),
              // Text expanded to the left
              Expanded(
                child: Align(
                  alignment: text == 'Login' || text == 'Sign Up'
                      ? Alignment.center
                      : Alignment.centerLeft,
                  child: Text(
                    text,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              // Suffix Icon (right)
              if (suffexIcon != null) ...[
                const SizedBox(width: 8), // Space between text and icon
                Icon(
                  suffexIcon!.icon,
                  size: 24,
                  color: Colors.white,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
