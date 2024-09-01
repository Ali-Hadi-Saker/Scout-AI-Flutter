import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scout_ai/widgets/button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String? name;
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
    });
    print('$name');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
        title: const Center(child: Text("User Details")),
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
            const SizedBox(height: 120,),
            CustomizedButton(
              text: "User Infos", 
              onPressed: ()=>Navigator.pushNamed(context, "user-infos"),
              suffexIcon: const Icon(Icons.arrow_forward_ios_sharp),
              preffixIcon: const Icon(Icons.edit),
              heigth: 80),
            const SizedBox(height: 20,),
            CustomizedButton(
              text: "Password and Security", 
              onPressed: ()=> Navigator.pushNamed(context, "security"),
              suffexIcon: const Icon(Icons.arrow_forward_ios_sharp),
              preffixIcon: const Icon(Icons.shield_rounded),
              heigth: 80),              
            const SizedBox(height: 20,),
            CustomizedButton(
              text: "History", 
              onPressed: ()=> Navigator.pushNamed(context, "history"),
              suffexIcon: const Icon(Icons.arrow_forward_ios_sharp),
              preffixIcon: const Icon(Icons.history),
              heigth: 80),
              Spacer(),
              CustomizedButton(
                text: "Logout", 
                onPressed: (){},
                heigth: 80,
                suffexIcon: const Icon(Icons.arrow_forward_ios_sharp),
                preffixIcon: Icon(Icons.logout),)

          ],
        ),
      ),
    );
  }
}
