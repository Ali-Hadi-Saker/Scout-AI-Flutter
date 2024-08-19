import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  const Button(
      {super.key,
      required this.text,
      required this.onPressed,
      this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,      
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),        
          color: Colors.blue,
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15, top: 15),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white, 
                fontSize: 22),
            ),
          )),
    );
  }
}
