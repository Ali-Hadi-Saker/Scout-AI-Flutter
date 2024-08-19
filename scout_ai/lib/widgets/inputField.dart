import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final TextEditingController controller;
  const InputField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.icon,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          suffix: obscureText == true? Icon(Icons.remove_red_eye):null,
            filled: true,
            fillColor: Colors.white.withOpacity(0.85),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[700], fontSize: 18),
            prefixIcon: Icon(
              icon,
              color: Colors.grey[700],
            )),
      ),
    );
  }
}
