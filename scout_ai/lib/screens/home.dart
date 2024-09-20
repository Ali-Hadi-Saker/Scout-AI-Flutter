import 'package:flutter/material.dart';
import 'package:scout_ai/utils/constant.dart';
import 'package:scout_ai/widgets/button.dart';

class HomeScreen extends StatefulWidget {
  final Function(int)? onNavigate;
  const HomeScreen({super.key, this.onNavigate});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgColor,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 100,
              child: Image.asset('assets/images/bg-design-1.png'),
              width: 150,
              height: 150,
            ),
            Positioned(
              bottom: 300,
              right: 10,
              child: Image.asset('assets/images/bg-design-2.png'),
              width: 150,
              height: 150,
            ),
            Positioned(
              top: 200,
              left: 0,
              child: Image.asset('assets/images/bg-design-4.png'),
              width: 100,
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 180,
                  ),
                  const SizedBox(
                    height: 120,
                    child: Image(
                        image:
                            AssetImage('assets/images/scout_ai_logo_only.png')),
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
                    // gradient: AppColors.primaryButtonGradient,
                    btnColor: AppColors.primaryButton,
                    height: 80,
                    text: "Search for an Item",
                    onPressed: () {
                      widget.onNavigate!(1);
                    },
                    suffexIcon: const Icon(Icons.search, color: Colors.white),
                  ),
                  const SizedBox(height: 15),
                  CustomizedButton(
                    // gradient: AppColors.primaryButtonGradient,
                    btnColor: AppColors.primaryButton,
                    height: 80,
                    text: "Drive your Car",
                    onPressed: () {
                      widget.onNavigate!(2);
                    },
                    suffexIcon:
                        const Icon(Icons.directions_car, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ));
  }
}
