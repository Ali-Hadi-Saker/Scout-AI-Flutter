import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisplayField extends StatelessWidget {
  final String text;
  final Icon preffixIcon;
  const DisplayField(
      {super.key, required this.text, required this.preffixIcon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        preffixIcon,
        SizedBox(width: 10,),
        Column(
          children: [
            Text(
              text,
              style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,  
                    ),
            ),
            const Divider(
                  color: Colors.grey, 
                  thickness: 1,
                ),
          ],
        )
      ],
    );
  }
}
