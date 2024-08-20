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
      backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 200,
                    width: 150,
                    child: Image(
                      image: AssetImage('assets/images/robot.png')),
                  ),
                ],
              ),
            const SizedBox(            
              height: 180,
              width: 180,
              child: Image(
                image: AssetImage('assets/images/scout_ai_logo_only.png')),
                ),
                const Text("Scout AI",
                style: TextStyle(
                  color: Color.fromRGBO(50,146,230, 1),
                  fontSize: 28,
                  fontWeight: FontWeight.w900
                ),),
                const SizedBox(height: 70,),
            CustomizedButton(
              heigth: 100,
              text: "Search for an Item", 
              onPressed: ()=>{
                Navigator.pushNamed(context, "upload-item")
              }, 
              suffexIcon:const Icon(
                Icons.search,color: 
                Colors.white,)),
            const SizedBox(
              height: 15,
            ),
            CustomizedButton(
              heigth: 100,
              text: "Drive yor Car",
              onPressed: ()=>{
                Navigator.pushNamed(context, "car-control")
              },
              suffexIcon: const Icon(
                Icons.directions_car,
                color: Colors.white,),),
        
            
          ],
        ),
      ),
    );
  }
}