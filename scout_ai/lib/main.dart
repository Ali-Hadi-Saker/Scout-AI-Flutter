import 'package:flutter/material.dart';
import 'package:scout_ai/provider/user_provider.dart';
import 'package:scout_ai/screens/car_control.dart';
import 'package:scout_ai/screens/history.dart';
import 'package:scout_ai/screens/home.dart';
import 'package:scout_ai/screens/login.dart';
import 'package:scout_ai/screens/register.dart';
import 'package:scout_ai/screens/search_result.dart';
import 'package:scout_ai/screens/security.dart';
import 'package:scout_ai/screens/settings.dart';
import 'package:scout_ai/screens/test.dart';
import 'package:scout_ai/screens/upload_item.dart';
import 'package:scout_ai/screens/user_infos.dart';
import 'package:scout_ai/widgets/bottom_navigation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => UserProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  late SharedPreferences prefs;
  bool isLogged = false;

  @override
  void initState() {
    super.initState();
    checkLogged();
  }

  void checkLogged() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      isLogged = prefs.getBool('isLogged') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: isLogged ? const BottomNav() : const LoginScreen(),
      routes: {
        "register": (context) => const RegisterScreen(),
        "login": (context) => const LoginScreen(),
        "home": (context) => const HomeScreen(),
        "upload-item": (context) => const UploadItemScreen(),
        "car-control": (context) => const CarControlScreen(),
        "search-result": (context) => const SearchResultScreen(),
        "test": (context) => TestScreen(),
        "setting": (context) => const SettingScreen(),
        "user-infos": (context) => const UserInfoScreen(),
        "security": (context) => const SecurityScreen(),
        "history": (context) => const HistoryScreen(),
        "bottom-nav": (context) => const BottomNav(),

      },
    );
  }
}
