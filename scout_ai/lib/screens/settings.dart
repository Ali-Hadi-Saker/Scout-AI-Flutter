import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String? name;
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
    });
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
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 18, right: 18),
        child: Column(
          children: [
Container(
  padding: const EdgeInsets.all(16), 
  decoration: BoxDecoration(
    color: Colors.grey[300], 
    borderRadius: BorderRadius.circular(8), 
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        spreadRadius: 2,
        blurRadius: 8,
        offset: Offset(0, 4),
      ),
    ],
  ),
  child: Row(
    children: [
      CircleAvatar(
        backgroundColor: Colors.grey[400], 
        radius: 30,
        child: Icon(
          Icons.person, 
          size: 30,
          color: Colors.white,
        ),
      ),
      const SizedBox(width: 20),
      Text(
        '$name',
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black87, 
        ),
      ),
    ],
  ),
),

            MaterialButton(
              onPressed: () => loadUserData(),
              color: Colors.amber,
              child: Text('click'),
            )
          ],
        ),
      ),
    );
  }
}
