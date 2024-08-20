import 'package:flutter/material.dart';
import 'package:scout_ai/widgets/button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 246, 246, 1),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              SizedBox(
                height: 200,
                width: 150,
                child: Image(
                  image: AssetImage('assets/images/robot.png')),
              ),
            SizedBox(            
              height: 150,
              width: 150,
              child: Image(
                image: AssetImage('assets/images/scout_ai_logo_only.png')),
                ),
            CustomizedButton(text: "Search for an Item", onPressed: ()=>{}),
            SizedBox(
              height: 10,
            ),
            CustomizedButton(text: "Drive yor Car", onPressed: ()=>{}),
        
            
          ],
        ),
      ),
    );
  }
}