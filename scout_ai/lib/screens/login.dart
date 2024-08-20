import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scout_ai/widgets/button.dart';
import 'package:scout_ai/widgets/inputField.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void login() async {
    try {
      var url = Uri.parse('http://192.168.1.21:8080/users/login');
      var response = http.post(
        url,
        headers: {
          "content-type": "application/json"
        },
        body: {
          "email": email.text,
          "password": password.text
        }  );
    } catch (e) {
      print('error $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/car2.jpg"),
                    fit: BoxFit.cover)),
          ),
          Container(
            color: Colors.black.withOpacity(0.4),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Hello,\nWelcome Back!!",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                InputField(
                    hintText: "Email",
                    controller: email,
                    icon: Icons.email,
                    obscureText: false),
                InputField(
                    hintText: "Password",
                    controller: password,
                    icon: Icons.lock,
                    obscureText: true),
                CustomizedButton(
                    text: "Login",
                    onPressed: () => {Navigator.pushNamed(context, "home")}),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Don't have an account? Sign Up",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
