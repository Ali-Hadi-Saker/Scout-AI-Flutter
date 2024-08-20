import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CarControlScreen extends StatefulWidget {
  const CarControlScreen({super.key});

  @override
  State<CarControlScreen> createState() => _CarControlScreenState();
}

class _CarControlScreenState extends State<CarControlScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()=>{
            Navigator.pop(context)}, 
            icon: Icon(Icons.arrow_back)),
          title: Center(child: Text("Car Control")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black
              ),
              height: MediaQuery.of(context).size.width,
              child: Center(
                child: Text("video Stream", style: TextStyle(color: Colors.white, fontSize: 24),),
              ),
            )
          ],
        ),
      ),
    );
  }
}