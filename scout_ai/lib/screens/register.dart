import 'package:flutter/material.dart';
import 'package:scout_ai/widgets/inputField.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fname = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InputField(
            hintText: "Full Name", 
            controller: fname,
            icon: Icons.person),
          InputField(
            hintText: "Email", 
            controller: email,
            icon: Icons.email,)],
      ),
    );
  }
}
