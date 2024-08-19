import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String textHint;
  final TextEditingController controller;
  const InputField({
                  super.key,
                  required this.textHint,
                  required this.controller});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
