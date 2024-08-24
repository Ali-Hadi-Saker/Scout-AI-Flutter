import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  void loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userDataJson = await prefs.getString('userData')!;

    var userData = jsonDecode(userDataJson);
    String name = userData['fname'];
    print('$name');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back)),
        title: Center(child: Text("User Details")),
      ),
      body: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 50,
              )
            ],
          ),
          MaterialButton(
            onPressed: () => loadUserData(),
            color: Colors.amber,
            child: Text('click'),
          )
        ],
      ),
    );
  }
}
