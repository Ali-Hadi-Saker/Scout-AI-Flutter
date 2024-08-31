import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:scout_ai/services/websocket.dart';
import 'package:scout_ai/widgets/video_stream.dart';

class CarControlScreen extends StatefulWidget {
  const CarControlScreen({super.key});

  @override
  State<CarControlScreen> createState() => _CarControlScreenState();
}

class _CarControlScreenState extends State<CarControlScreen> {
  late WebSocketService _webSocketService;

  @override
  void initState() {
    super.initState();
    _webSocketService = WebSocketService('ws://10.0.2.2:8080');
  }

  @override
  void dispose() {
    _webSocketService.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => {Navigator.pop(context)},
            icon: Icon(Icons.arrow_back)),
        title: Center(child: Text("Car Control")),
        actions: [
          IconButton(
              onPressed: () => {Navigator.pushNamed(context, "search-result")},
              icon: Icon(Icons.arrow_forward))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
                child: VideoStream(stream: _webSocketService.videoStream)),
            Expanded(
                child: Center(
              child: 
              // Joystick(
              //   mode: JoystickMode.all,
              //   listener: (details) {
              //     String command = 'x: ${details.x}, y: ${details.y}';
              //     _webSocketService.send(command);
              //     print('Joystick direction: ${command}');
              //   },
              // ),
              Column(
                children: [
                  Row(
                    children: [
                      ElevatedButton(
                      onPressed: () => _sendCommand('UP'),
                      child: Text('Forward'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () => _sendCommand('DOWN'),
                      child: Text('Backward'),
                    ),
                    ],
                    
                  ),
                  SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => _sendCommand('LEFT'),
                  child: Text('Left'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _sendCommand('RIGHT'),
                  child: Text('Right'),
                ),
              ],)
                ],
              ),
              
            ))
          ],
        ),
      ),
    );
  }
}
