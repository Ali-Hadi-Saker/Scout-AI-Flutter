import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoStream extends StatefulWidget {
  final String streamUrl;
  const VideoStream({super.key, required this.streamUrl});

  @override
  _VideoStreamState createState() => _VideoStreamState();
}

class _VideoStreamState extends State<VideoStream> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.streamUrl)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : CircularProgressIndicator(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
