import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scout_ai/provider/user_provider.dart';
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
  

  void logout() async {
    prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushReplacementNamed(context, 'login');
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final String? fname = userProvider.user?.fname;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
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
                color: Color.fromARGB(255, 194, 199, 204),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage('assets/images/default-profile.png'),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    fname ?? "No Name",
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
                gradient: AppColors.primaryButtonGradient,
                text: "User Infos",
                onPressed: () => Navigator.pushNamed(context, "user-infos"),
                suffexIcon: const Icon(Icons.arrow_forward_ios_sharp),
                preffixIcon: const Icon(Icons.edit),
                height: 80),
            const SizedBox(
              height: 20,
            ),
            CustomizedButton(
                gradient: AppColors.primaryButtonGradient,
                text: "Security",
                onPressed: () => Navigator.pushNamed(context, "security"),
                suffexIcon: const Icon(Icons.arrow_forward_ios_sharp),
                preffixIcon: const Icon(Icons.shield_rounded),
                height: 80),
            const SizedBox(
              height: 20,
            ),
            CustomizedButton(
                gradient: AppColors.primaryButtonGradient,
                text: "History",
                onPressed: () => Navigator.pushNamed(context, "history"),
                suffexIcon: const Icon(Icons.arrow_forward_ios_sharp),
                preffixIcon: const Icon(Icons.history),
                height: 80),
            Spacer(),
            CustomizedButton(
              gradient: AppColors.logoutButtonGradient,
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
