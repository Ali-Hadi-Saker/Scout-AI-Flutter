import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  const InputField(
      {super.key, required this.hintText, required this.controller, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: controller,
        decoration:
            InputDecoration(
              border: OutlineInputBorder(), 
              hintText: hintText,
              prefixIcon: Icon(icon)
              ),
      ),
    );
  }
}
