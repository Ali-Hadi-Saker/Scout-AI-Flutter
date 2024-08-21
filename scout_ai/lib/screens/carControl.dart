import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:scout_ai/widgets/videoStream.dart';

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
          actions: [IconButton(onPressed: ()=>{
            Navigator.pushNamed(context, "search-result")
          }, 
          icon: Icon(Icons.arrow_forward))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            // Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10),
            //     color: Colors.black
            //   ),
            //   height: MediaQuery.of(context).size.width,
            //   child: Center(
            //     child: Text("video Stream", style: TextStyle(color: Colors.white, fontSize: 24),),
            //   ),
            // ),
            Expanded(child: VideoSctream(streamUrl: 'http://192.168.0.106')),
            Expanded(
              child: Center(
                child: Joystick(
                  mode: JoystickMode.all,
                  listener: (details)=>{
                    print('Joystick direction: (${details.x}, ${details.y})')

                  },),
              ))
          ],
        ),
      ),
    );
  }
}