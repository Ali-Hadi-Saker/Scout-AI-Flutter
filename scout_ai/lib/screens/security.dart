import 'package:flutter/material.dart';
import 'package:scout_ai/widgets/edit_input_field.dart';
import 'package:scout_ai/widgets/screen_icon.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back)),
        title: Center(child: Text("Password and Security")),
      ),
      body: Column(
        children: [
          ScreenIcon(screenIon: Icon(Icons.shield_rounded)),
          SizedBox(height: 100,),
          editInputField(
            hintText: "Current Password", 
            prefixIcon: Icon(Icons.shield_rounded), 
            controller: controller)
        ],
      ),
    );
  }
}