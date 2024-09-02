import 'package:flutter/material.dart';

class editInputField extends StatelessWidget {
  final Icon prefixIcon;
  final TextEditingController? controller;
  const editInputField(
      {super.key, required this.prefixIcon, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: TextField(
        
        controller: controller,      
        decoration: InputDecoration(
          prefixIcon: prefixIcon,        
          hintStyle: TextStyle(color: Colors.grey),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
