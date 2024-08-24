import 'package:flutter/material.dart';
import 'package:scout_ai/widgets/editInputField.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back)),
        title: Center(child: Text("User Infos")),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 18, right: 18),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.grey[400], 
                radius: 40,
                child: Icon(
                  Icons.edit,
                  size: 30,
                  color: Colors.white,),
              ),
              
            ),
            SizedBox(height: 100,),
            editInputField(hintText: "Username"),
            SizedBox(height: 20,),
            editInputField(hintText: "Email")
          ],
        ),
      ),
    );
  }
}