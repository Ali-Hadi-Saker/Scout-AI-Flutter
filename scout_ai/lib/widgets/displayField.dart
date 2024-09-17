import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class displayField extends StatelessWidget {
  final String? text;
  final Icon preffixIcon;
  final String placeholder;
  const displayField({super.key, this.text, required this.preffixIcon, this.placeholder = 'Not available'});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey, 
              width: 1.0, 
            ),
          ),
        ),
        child: Row(
          children: [
            preffixIcon,
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(
                  text?.isNotEmpty == true? text!: placeholder,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                
              ],
            )
          ],
        ),
       
      ),
    );
  }
}
