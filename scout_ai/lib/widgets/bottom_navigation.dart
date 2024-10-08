import 'package:flutter/material.dart';
import 'package:scout_ai/screens/car_control.dart';
import 'package:scout_ai/screens/home.dart';
import 'package:scout_ai/screens/settings.dart';
import 'package:scout_ai/screens/upload_item.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectedIndex = 0;
  List<Widget> screens = [];

  @override
  void initState() {
    super.initState();
    screens = [
    HomeScreen(
      onNavigate: _onNavigate,
    ),
    const UploadItemScreen(),
    const CarControlScreen(),
    const SettingScreen()
  ];
  }

  

  void _onNavigate(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void itemTaped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: itemTaped,
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
