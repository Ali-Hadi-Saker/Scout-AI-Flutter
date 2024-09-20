import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  late VlcPlayerController _vlcPlayerController;

  @override
  void initState() {
    super.initState();
    _vlcPlayerController = VlcPlayerController.network(
      'http://172.20.10.3',  // Correct URL and port
      hwAcc: HwAcc.full,
      autoPlay: true,
    );
  }

  @override
  void dispose() {
    _vlcPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ESP32 Camera Stream'),
      ),
      body: VlcPlayer(
        controller: _vlcPlayerController,
        aspectRatio: 16 / 9,
        placeholder: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

