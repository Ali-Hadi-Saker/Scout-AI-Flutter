import 'dart:async';
import 'dart:typed_data';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  final WebSocketChannel _channel;
  final StreamController<Uint8List> _controller = StreamController<Uint8List>.broadcast();
  final StreamController<String> _detectionResultsController = StreamController<String>.broadcast();

  WebSocketService(String url)
      : _channel = WebSocketChannel.connect(Uri.parse(url)) {
    // Notify server that Flutter client is connected
    _channel.sink.add('FLUTTER_CONNECTED');

    // Listen to incoming WebSocket messages
    _channel.stream.listen(
      (data) {
        if (data is Uint8List) {
          print('Received binary data of length: ${data.length}');
          _controller.add(data);
        } else if (data is String) {
          // Handle string messages, assuming detection results are sent as text
          print('Received detection result: $data');
          _detectionResultsController.add(data);
        } else {
          print('Received unknown data type');
        }
      },
      onError: (error) {
        // Handle WebSocket errors
        print('WebSocket error: $error');
        _controller.addError(error);
        _attemptReconnect(url);
      },
      onDone: () {
        print('WebSocket connection closed');
        _attemptReconnect(url);
      },
      cancelOnError: true,
    );

    print('WebSocketService initialized and connected to $url');
  }

  // Send a message to the WebSocket server
  void send(String message) {
    if (_channel.closeCode == null) {
      _channel.sink.add(message);
    } else {
      print('Cannot send message, WebSocket is closed');
    }
  }

  // Getter for the video stream
  Stream<Uint8List> get videoStream => _controller.stream;
  // Getter for detection results stream
  Stream<String> get detectionResultsStream => _detectionResultsController.stream;

  // Attempt to reconnect on connection loss
  void _attemptReconnect(String url) {
    // Wait a bit before reconnecting
    Future.delayed(Duration(seconds: 5), () {
      if (!_controller.isClosed) {
        print('Attempting to reconnect to WebSocket...');
        WebSocketService(url); // Reconnect by creating a new instance
      }
    });
  }

  // Dispose method to close resources
  void dispose() {
    _controller.close();
    _channel.sink.close();
  }
}
