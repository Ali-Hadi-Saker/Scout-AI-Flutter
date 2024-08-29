import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  final WebSocketChannel _channel;

  WebSocketService(String url)
      : _channel = WebSocketChannel.connect(Uri.parse(url));

  void send(message) {
    _channel.sink.add(message);
  }

  Stream<dynamic> get stream => _channel.stream;

  void dispose() {
    _channel.sink.close();
  }
}
