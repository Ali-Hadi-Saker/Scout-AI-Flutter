import 'package:flutter/material.dart';

class CustomizedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final Icon? suffexIcon;
  const CustomizedButton(
      {super.key, required this.text, required this.onPressed, this.width, this.suffexIcon});

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
            child: Row(
              children: [
                Text(
                  text,
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                if(suffexIcon != null) ...[
                  SizedBox(width: 30,),
                  suffexIcon!
                ]
              ],
            ),
          )),
    );
  }
}
