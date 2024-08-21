import 'package:flutter/material.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';

class VideoSctream extends StatelessWidget {
  final String streamUrl;
  const VideoSctream({super.key, required this.streamUrl});

  @override
  Widget build(BuildContext context) {
    return Mjpeg(
      stream: streamUrl,
      isLive: true,
      error: (context, error, stackTrace) {
        return Center(child: Text('Failed to load stream'));
      },
      loading: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}