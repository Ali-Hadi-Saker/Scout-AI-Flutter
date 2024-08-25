import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scout_ai/widgets/edit_input_field.dart';
import 'package:scout_ai/widgets/screen_icon.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  String? currentPassword;
  String? newPassword;
  String? confirmNewPassword;
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  void initState() {
    super.initState();
    loadUserData();
  }

  void loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userDataJson = prefs.getString('userData')!;

    var userData = jsonDecode(userDataJson);
    setState(() {
      currentPassword = userData['password'];
    });
  }

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
          SizedBox(
            height: 100,
          ),
          editInputField(
            hintText: currentPassword!,
            prefixIcon: Icon(Icons.shield_rounded),
          ),
          editInputField(
            hintText: "New Password", 
            prefixIcon: Icon(Icons.shield_rounded),
            controller: newPasswordController,
          ),
          editInputField(
            hintText: "Confirm New Password", 
            prefixIcon: Icon(Icons.shield_rounded),
            controller: confirmNewPasswordController,
          )
        ],
      ),
    );
  }
}
