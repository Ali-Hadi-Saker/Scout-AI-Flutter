import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(246, 246, 246, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Positioned(
            top: 100,
            right: 200,
            child: SizedBox(
              height: 200,
              width: 150,
              child: Image(
                image: AssetImage('assets/images/robot.png')),
            )),
          Center(
            child: SizedBox(            
              height: 200,
              width: 200,
              child: Image(
                image: AssetImage('assets/images/scout_ai_logo_only.png')
                ),),
          ),

        ],
      ),
    );
  }
}