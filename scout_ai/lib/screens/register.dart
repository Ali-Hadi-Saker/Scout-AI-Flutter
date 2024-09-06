import 'package:flutter/material.dart';
import 'package:scout_ai/utils/constant.dart';
import 'package:scout_ai/widgets/button.dart';
import 'package:scout_ai/widgets/input_field.dart';
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
      var response = await http
          .post(url,
              headers: {"Content-type": "application/json"},
              body: json.encode({
                'fname': fname.text,
                'email': email.text,
                'password': password.text
              }))
          .timeout(const Duration(seconds: 15));

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
          padding: const EdgeInsets.all(25),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Create an Account",
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
                        color: AppColors.primaryButtonColor,
                        text: "Sign Up",
                        onPressed: () => createUser()),
                        const SizedBox(
                            height: 15,
                          ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account ",
                            style: TextStyle(color: Colors.white),
                          ),
                          InkWell(
                            onTap: () => Navigator.pushNamed(context, "login"),
                            child: const Text("Login",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15)),
                          )
                        ],
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ]),
    );
  }
}
