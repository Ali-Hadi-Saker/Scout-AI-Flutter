import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scout_ai/classes/user.dart';
import 'package:scout_ai/provider/user_provider.dart';
import 'package:scout_ai/utils/constant.dart';
import 'package:scout_ai/widgets/button.dart';
import 'package:scout_ai/widgets/input_field.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

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
      var url = Uri.parse('http://10.0.2.2:8080/users/login');
      var response = await http.post(url,
          headers: {"content-type": "application/json"},
          body: jsonEncode({"email": email.text, "password": password.text}));
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        print(responseData.runtimeType);

        var userDataJson = responseData['user'];
        String userToken = jsonEncode(responseData['token']);

        User user = User(
            fname: userDataJson['fname'],
            email: userDataJson['email'],
            password: userDataJson['password']);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('userToken', userToken);
        await prefs.setBool("isLogged", true);

        final userDataProvider = context.read<UserProvider>();
        userDataProvider.setUser(user);

        final userInfos = userDataProvider.user;
        print('User name: $userInfos');

        // bool isLogged = prefs.getBool('isLogged')!;
        // print(isLogged);

        // String data = prefs.getString('userData')!;
        // String token = prefs.getString('userToken')!;
        // print('user data: ${data}');
        // print('user token: ${token}');

        Navigator.pushNamed(context, "home");
      } else {
        print("faild to login");
        print('Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
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
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
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
                            color: AppColors.primaryButtonColor,
                            text: "Login",
                            onPressed: () => {
                                  // Navigator.pushNamed(context, "home")
                                  login()
                                }),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account? ",
                              style: TextStyle(color: Colors.white),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, 'register');
                              },
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
