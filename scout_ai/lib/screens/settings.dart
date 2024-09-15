import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scout_ai/utils/constant.dart';
import 'package:scout_ai/widgets/button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late SharedPreferences prefs;
  String? name;
  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  void loadUserData() async {
    prefs = await SharedPreferences.getInstance();
    String userDataJson = prefs.getString('userData')!;

    var userData = jsonDecode(userDataJson);
    setState(() {
      name = userData['fname'];
    });
    print('$name');
  }

  void logout() async {
    prefs = await SharedPreferences.getInstance();
    await prefs.remove('userToken');
    await prefs.setBool('isLogged', false);
    Navigator.pushReplacementNamed(context, 'login');}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
        title: const Text("User Details"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[400],
                    radius: 30,
                    child: const Icon(
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
            const SizedBox(
              height: 120,
            ),
            CustomizedButton(
                color: AppColors.primaryButtonColor,
                text: "User Infos",
                onPressed: () => Navigator.pushNamed(context, "user-infos"),
                suffexIcon: const Icon(Icons.arrow_forward_ios_sharp),
                preffixIcon: const Icon(Icons.edit),
                height: 80),
            const SizedBox(
              height: 20,
            ),
            CustomizedButton(
                color: AppColors.primaryButtonColor,
                text: "Security",
                onPressed: () => Navigator.pushNamed(context, "security"),
                suffexIcon: const Icon(Icons.arrow_forward_ios_sharp),
                preffixIcon: const Icon(Icons.shield_rounded),
                height: 80),
            const SizedBox(
              height: 20,
            ),
            CustomizedButton(
                color: AppColors.primaryButtonColor,
                text: "History",
                onPressed: () => Navigator.pushNamed(context, "history"),
                suffexIcon: const Icon(Icons.arrow_forward_ios_sharp),
                preffixIcon: const Icon(Icons.history),
                height: 80),
            Spacer(),
            CustomizedButton(
              color: AppColors.logoutButtonColor,
              text: "Logout",
              onPressed: logout,
              height: 80,
              suffexIcon: const Icon(Icons.arrow_forward_ios_sharp),
              preffixIcon: Icon(Icons.logout),
            ),
            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}
