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
    return StreamBuilder<Uint8List>(
        stream: widget.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
