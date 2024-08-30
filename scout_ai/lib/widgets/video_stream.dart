import 'package:flutter/material.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';

class VideoStream extends StatelessWidget {
  final String streamUrl;
  const VideoStream({super.key, required this.streamUrl});

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
