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
        decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), 
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey[700], fontSize: 18),
              prefixIcon: Icon(icon, color: Colors.grey[700],)
              ),
      ),
    );
  }
}
