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
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Row(
          children: [
            preffixIcon,
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    text?.isNotEmpty == true? text!: placeholder,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 65, 62, 62),
                    thickness: 1,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
