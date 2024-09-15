import 'package:flutter/material.dart';
import 'package:scout_ai/utils/constant.dart';
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
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset('assets/images/bg-design-1.png'),
            width: 150,
            height: 150,),
          Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 180,),
            const SizedBox(
              height: 120,
              child: Image(image: AssetImage('assets/images/scout_ai_logo_only.png')),
            ),
            const Text(
              "Scout AI",
              style: TextStyle(
                color: Color.fromRGBO(50, 146, 230, 1),
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
            const Spacer(),
            CustomizedButton(
              color: AppColors.primaryButtonColor,
              height: 80,
              text: "Search for an Item",
              onPressed: () {
                Navigator.pushNamed(context, "upload-item");
              },
              suffexIcon: const Icon(Icons.search, color: Colors.white),
            ),
            const SizedBox(height: 15),
            CustomizedButton(
              color: AppColors.primaryButtonColor,
              height: 80,
              text: "Drive your Car",
              onPressed: () {
                Navigator.pushNamed(context, "car-control");
              },
              suffexIcon: const Icon(Icons.directions_car, color: Colors.white),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
        ],
      )
    );
  }
}
