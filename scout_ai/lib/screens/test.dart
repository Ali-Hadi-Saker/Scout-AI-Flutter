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
      'http://<ESP32_IP>/stream',  // Replace with the ESP32 IP address
      hwAcc: HwAcc.full,
      autoPlay: true,
      options: VlcPlayerOptions(),
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
      body: Center(
        child: VlcPlayer(
          controller: _vlcPlayerController,
          aspectRatio: 16 / 9,
          placeholder: Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}