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
  TextEditingController password = TextEditingController();
  TextEditingController confirmPasswrod = TextEditingController();


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
            icon: Icons.person,
            obscureText: false,),            
          InputField(
            hintText: "Email", 
            controller: email,
            icon: Icons.email,
            obscureText: false,),
          InputField(
            hintText: "Password", 
            controller: password,
            icon: Icons.lock_rounded,
            obscureText: true,),
            InputField(
            hintText: "Confirm Password", 
            controller: confirmPasswrod,
            icon: Icons.lock_rounded,
            obscureText: true,)],
      ),
    );
  }
}
