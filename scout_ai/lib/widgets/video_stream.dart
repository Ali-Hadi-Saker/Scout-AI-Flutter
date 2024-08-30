import 'dart:typed_data';
import 'package:flutter/material.dart';

class VideoStream extends StatefulWidget {
  final Stream<Uint8List> stream;
  const VideoStream({super.key, required this.stream});

  @override
  State<VideoStream> createState() => _VideoStreamState();
}

class _VideoStreamState extends State<VideoStream> {
  Uint8List? _imageData;

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
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if(snapshot.hasData){
            _imageData = snapshot.data;
            print('Received image data of length: ${_imageData?.length}');
            return Center(
              child: Image.memory(_imageData!),
        );
          }
          return Center(child: Text('No data'));
        });
  }
}
