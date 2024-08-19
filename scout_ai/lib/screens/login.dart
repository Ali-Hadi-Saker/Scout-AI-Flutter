import 'package:flutter/material.dart';
import 'package:scout_ai/widgets/inputField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/car3.jpg"),
              fit: BoxFit.cover)
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.1),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InputField(
                hintText: "Email", 
                controller: email, 
                icon: Icons.email, 
                obscureText: false),
              InputField(
                hintText: "Password", 
                controller: password, 
                icon: Icons.lock, 
                obscureText: true)
            ],
          ),
        )
      ],
    ),
    );
  }
}
