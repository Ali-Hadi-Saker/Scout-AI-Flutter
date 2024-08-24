import 'package:flutter/material.dart';
import 'package:scout_ai/screens/carControl.dart';
import 'package:scout_ai/screens/home.dart';
import 'package:scout_ai/screens/login.dart';
import 'package:scout_ai/screens/searchResult.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectedIndex = 0;
  List screens = [
    HomeScreen(),
    CarControlScreen(),
    SearchResultScreen(),
    LoginScreen()
  ];

  void itemTaped (int index){
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: ,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey.shade400,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_a_photo_outlined), label: 'Add Item'),
            BottomNavigationBarItem(
                icon: Icon(Icons.directions_car), label: 'Car'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Setting')
          ]),
    );
  }
}
