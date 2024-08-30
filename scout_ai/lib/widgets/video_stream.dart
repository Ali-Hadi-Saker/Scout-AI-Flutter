import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';

class VideoStream extends StatefulWidget {
  final Stream<Uint8List> stream;
  const VideoStream({super.key, required this.stream});

  @override
  State<VideoStream> createState() => _VideoStreamState();
}

class _VideoStreamState extends State<VideoStream> {
  Uint8List? _imageData;
  bool _isLoading = true;
  
  @override
  Widget build(BuildContext context) {
    return Mjpeg(
      stream: widget.streamUrl,
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
