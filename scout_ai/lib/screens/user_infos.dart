import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scout_ai/provider/user_provider.dart';
import 'package:scout_ai/utils/constant.dart';
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
  late TextEditingController fnameController;
  late TextEditingController emailController;
  @override
  void initState() {
    super.initState();

    fnameController = TextEditingController();
    emailController = TextEditingController();

    final userInfos = context.read<UserProvider>().user;
    if (userInfos != null) {
      fnameController.text = userInfos.fname;
      emailController.text = userInfos.email;
    }
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
              controller: fnameController,
            ),
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
                      color: AppColors.primaryButtonColor,
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
                      color: AppColors.primaryButtonColor,
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
