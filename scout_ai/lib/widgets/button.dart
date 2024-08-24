import 'package:flutter/material.dart';

class CustomizedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? heigth;
  final Icon? preffixIcon;
  final Icon? suffexIcon;
  const CustomizedButton(
      {super.key, required this.text, required this.onPressed, this.width, this.suffexIcon, this.heigth, this.preffixIcon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: heigth,
      child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: Colors.blue,
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if(preffixIcon != null) ...[
                  Icon(
                    preffixIcon!.icon,
                    size: 24,
                    color: Colors.white,
                  ),
                  SizedBox(width: 24,)
                ],
                Text(
                  text,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                if(suffexIcon != null) ...[
                  SizedBox(width: 24,),
                  Icon(
                    suffexIcon!.icon,
                    size: 24,
                    color: Colors.white,)
                  
                ]
              ],
            ),
          )),
    );
  }
}
