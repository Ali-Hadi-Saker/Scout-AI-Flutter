import 'package:flutter/material.dart';
import 'package:scout_ai/screens/carControl.dart';
import 'package:scout_ai/screens/home.dart';
import 'package:scout_ai/screens/login.dart';
import 'package:scout_ai/screens/register.dart';
import 'package:scout_ai/screens/searchResult.dart';
import 'package:scout_ai/screens/test.dart';
import 'package:scout_ai/screens/uploadItem.dart';
import 'package:scout_ai/widgets/bottomNavigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BottomNav(),
      routes: {
        "register": (context)=> const RegisterScreen(),
        "login": (context)=> const LoginScreen(),
        "home": (context)=> const HomeScreen(),
        "upload-item": (context)=> const UploadItemScreen(),
        "car-control": (context)=> const CarControlScreen(),
        "search-result": (context)=> const SearchResultScreen(),
        "test": (context) => TestScreen(),

      },
    );
  }
}

