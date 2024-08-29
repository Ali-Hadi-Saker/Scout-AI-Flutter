import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter/foundation.dart';

class WebSocketService {
  final WebSocketChannel _channel;

  WebSocketService(String url)
      : _channel = WebSocketChannel.connect(Uri.parse(url));

  void send(message) {
    _channel.sink.add(message);
  }
}
