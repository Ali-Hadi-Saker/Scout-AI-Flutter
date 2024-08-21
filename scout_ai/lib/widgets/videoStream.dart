import 'package:flutter/material.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';

class VideoSctream extends StatelessWidget {
  final String streamUrl;
  const VideoSctream({super.key, required this.streamUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Mjpeg(
          stream: streamUrl, 
          isLive: true,),
      ),
    );
  }
}