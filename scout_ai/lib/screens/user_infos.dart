import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scout_ai/widgets/button.dart';
import 'package:scout_ai/widgets/edit_input_field.dart';
import 'package:scout_ai/widgets/screen_icon.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  String? name;
  String? email;
  TextEditingController fnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  void loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userDataJson = prefs.getString('userData')!;

    var userData = jsonDecode(userDataJson);
    setState(() {
      name = userData['fname'];
      email = userData['email'];
      fnameController.text = name!;
      emailController.text = email!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
        title: const Center(child: Text("User Infos")),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 18, right: 18),
        child: Column(
          children: [
            ScreenIcon(screenIon: Icon(Icons.edit)),
            const SizedBox(height: 100),
            editInputField(
                prefixIcon: Icon(Icons.person), 
                hintText: "Username",
                controller: fnameController,),
            const SizedBox(height: 20),
            editInputField(
                prefixIcon: Icon(Icons.email), 
                hintText: "Email",
                controller: emailController,
                ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: CustomizedButton(
                      text: "Save",
                      onPressed: () {
                        print("Save button pressed");
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: CustomizedButton(
                      text: "Discard",
                      onPressed: () {
                        print("Discard button pressed");
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
