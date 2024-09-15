import 'package:flutter/cupertino.dart';

class SmallButton extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback onPressed;
  const SmallButton({super.key, required this.color, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
