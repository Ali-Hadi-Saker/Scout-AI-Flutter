import 'package:flutter/material.dart';
import 'package:scout_ai/widgets/button.dart';
import 'package:scout_ai/widgets/inputField.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  void createUser() async {
    try {
      var url = Uri.parse('http://192.168.1.21:8080/users/register');
      var response = await http.post(url,
          headers: {"Content-type": "application/json"},
          body: json.encode({
            'fname': fname.text,
            'email': email.text,
            'password': password.text
          }));

      if (response.statusCode == 201) {
        print('User registered successfully!');
        print('Response body: ${response.body}');
        Navigator.pushNamed(context, 'login');
      } else {
        print('Failed to register user.');
        print('Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/car3.jpg"),
                  fit: BoxFit.cover)),
        ),
        Container(
          color: Colors.black.withOpacity(0.4),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InputField(
                  hintText: "Full Name",
                  controller: fname,
                  icon: Icons.person,
                  obscureText: false,
                ),
                InputField(
                  hintText: "Email",
                  controller: email,
                  icon: Icons.email,
                  obscureText: false,
                ),
                InputField(
                  hintText: "Password",
                  controller: password,
                  icon: Icons.lock_rounded,
                  obscureText: true,
                ),
                InputField(
                  hintText: "Confirm Password",
                  controller: confirmPasswrod,
                  icon: Icons.lock_rounded,
                  obscureText: true,
                ),
                CustomizedButton(
                    text: "Sign Up", onPressed: () => {createUser()}),
                const Text(
                  "Already have an account?",
                  style: TextStyle(color: Colors.white),
                )
              ]),
        ),
      ]),
    );
  }
}
