import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scout_ai/provider/user_provider.dart';
import 'package:scout_ai/utils/constant.dart';
import 'package:scout_ai/widgets/button.dart';
import 'package:scout_ai/widgets/edit_input_field.dart';
import 'package:scout_ai/widgets/screen_icon.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  String? email;
  late TextEditingController fnameController;
  late TextEditingController emailController;
  @override
  void initState() {
    super.initState();

    fnameController = TextEditingController();

    final userInfos = context.read<UserProvider>().user;
    if (userInfos != null) {
      fnameController.text = userInfos.fname;
      print(userInfos.fname);
      email = userInfos.email;
      print(userInfos.email);
    }
  }

  void save() {
    final newName = fnameController.text;
    final userProvider = context.read<UserProvider>();
    userProvider.setName(newName);
    print(userProvider.user?.fname);

    FocusScope.of(context).unfocus();
  }

  void discard() {
    final userInfos = context.read<UserProvider>().user;
    if (userInfos != null) {
      fnameController.text = userInfos.fname;
    }
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
        title: const Text("User Infos"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 18, right: 18),
        child: Column(
          children: [
            const ScreenIcon(screenIon: Icon(Icons.edit)),
            const SizedBox(height: 100),
            editInputField(
              prefixIcon: const Icon(Icons.person),
              controller: fnameController,
            ),
            const SizedBox(height: 20),
            editInputField(
              prefixIcon: const Icon(Icons.email),
              hintText: email,
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
                        save();
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
                        discard();
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
