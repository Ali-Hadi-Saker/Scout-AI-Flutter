import 'dart:async';
import 'dart:typed_data';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  final WebSocketChannel _channel;
  final _controller = StreamController<Uint8List>();

  WebSocketService(String url)
      : _channel = WebSocketChannel.connect(Uri.parse(url)) {
    _channel.stream.listen((data) {
      if (data is Uint8List) {
        print('Received data of length: ${data.length}');
        _controller.add(data);
      }else if (data is String) {
          print('Received text data: $data');
        } else {
          print('Received unknown data type');
        }
    },
      onError: (error) {
        // Handle WebSocket errors
        print('WebSocket error: $error');
        _controller.addError(error);
      },);
      print('WebSocketService initialized and connected to $url');
}

  void send(message) {
    _channel.sink.add(message);
  }

  Stream<Uint8List> get videoStream => _controller.stream;

  void dispose() {
    _controller.close();
    _channel.sink.close();
  }
}
