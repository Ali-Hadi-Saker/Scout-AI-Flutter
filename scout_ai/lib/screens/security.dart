import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scout_ai/utils/constant.dart';
import 'package:scout_ai/widgets/edit_input_field.dart';
import 'package:scout_ai/widgets/screen_icon.dart';
import 'package:scout_ai/widgets/small_button.dart';
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
      currentPassword = userData['password'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
        title: const Text("Security"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: Column(
          children: [
            const ScreenIcon(screenIon: Icon(Icons.shield_rounded)),
            const SizedBox(
              height: 100,
            ),
            editInputField(
              hintText: currentPassword!,
              prefixIcon: const Icon(Icons.shield_rounded),
            ),
            editInputField(
              hintText: "New Password",
              prefixIcon: const Icon(Icons.shield_rounded),
              controller: newPasswordController,
            ),
            editInputField(
              hintText: "Confirm New Password",
              prefixIcon: const Icon(Icons.shield_rounded),
              controller: confirmNewPasswordController,
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child:
                            // CustomizedButton(
                            //     color: AppColors.primaryButtonColor,
                            //     text: 'Cancel',
                            //     onPressed: () => print('Change canceld')),
                            SmallButton(
                                gradient: AppColors.primaryButtonGradient,
                                onPressed: () {
                                  print('Changed canceld');
                                },
                                text: 'Cancel'))),
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child:
                            // CustomizedButton(
                            //   color: AppColors.primaryButtonColor,
                            //   text: 'Save',
                            //   onPressed: ()=> print('Changes saved')),
                            SmallButton(
                                gradient: AppColors.primaryButtonGradient,
                                onPressed: () {
                                  print('Changed saved');
                                },
                                text: 'Save')))
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
