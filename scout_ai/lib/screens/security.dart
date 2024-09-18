import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:scout_ai/provider/user_provider.dart';
import 'package:scout_ai/utils/constant.dart';
import 'package:scout_ai/widgets/edit_input_field.dart';
import 'package:scout_ai/widgets/screen_icon.dart';
import 'package:scout_ai/widgets/small_button.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  Future<void> _changePassword(String email, String currentPassword, String newPassword) async {
    final url = Uri.parse('http://localhost:8080/users/changePassword');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'oldPassword': currentPassword,
          'newPassword': newPassword,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data['message'])),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${response.body}')),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $error')),
      );
    }
  }
@override
Widget build(BuildContext context) {
  final email = Provider.of<UserProvider>(context).user?.email;

  return Scaffold(
    backgroundColor: AppColors.bgColor,
    appBar: AppBar(
      backgroundColor: AppColors.bgColor,
      leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back)),
      title: const Text("Security"),
      centerTitle: true,
    ),
    body: SingleChildScrollView( // Wrap the Column in a SingleChildScrollView
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: Column(
          children: [
            const ScreenIcon(screenIon: Icon(Icons.shield_rounded)),
            const SizedBox(
              height: 100,
            ),
            editInputField(
              hintText: "Current Password",
              prefixIcon: const Icon(Icons.shield_rounded),
              controller: currentPasswordController, // Add controller for current password
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
            const SizedBox(height: 20), // Add some space before buttons
            Row(
              children: [
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: SmallButton(
                            gradient: AppColors.primaryButtonGradient,
                            onPressed: () {
                              print('Changed cancelled');
                            },
                            text: 'Cancel'))),
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: SmallButton(
                            gradient: AppColors.primaryButtonGradient,
                            onPressed: () {
                              if (newPasswordController.text ==
                                  confirmNewPasswordController.text) {
                                _changePassword(
                                    email!,
                                    currentPasswordController.text,
                                    newPasswordController.text);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'New password and confirm password do not match')),
                                );
                              }
                            },
                            text: 'Save')))
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    ),
  );
}

  }

