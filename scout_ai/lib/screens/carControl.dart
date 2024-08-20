import 'package:flutter/material.dart';

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
      ),
    );
  }
}