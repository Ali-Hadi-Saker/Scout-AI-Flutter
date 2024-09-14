import 'dart:async';
import 'dart:typed_data';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  final WebSocketChannel _channel;
  final StreamController<Uint8List> _videoStreamController =
      StreamController<Uint8List>.broadcast();
  final StreamController<String> _detectionResultsController =
      StreamController<String>.broadcast();

  WebSocketService(String url)
      : _channel = WebSocketChannel.connect(Uri.parse(url)) {
    // Notify server that Flutter client is connected
    _channel.sink.add('FLUTTER_CONNECTED');

    // Listen to incoming WebSocket messages
    _channel.stream.listen(
      (data) {
        if (data is Uint8List) {
          print('Received binary data of length: ${data.length}');
          _videoStreamController.add(data); // Add binary data to video stream
        } else if (data is String) {
          String validJsonData = data.replaceAll("'", '"');
          try {
            final decodedData = jsonDecode(validJsonData) as List<dynamic>;
            if (decodedData.isNotEmpty && decodedData[0] is Map<String, dynamic>) {
              final label = decodedData[0]['label'] as String?;
              if (label != null) {
                print(label);
                _detectionResultsController.add(label);  // Add the formatted label to the stream
              } else {
                print('Label not found in the received data');
              }
            }
          } catch (e) {
            print('Error parsing detection result: $e');
          }
          print('Received detection result: $data');
          // Add text data to detection results stream
        } else {
          print('Received unknown data type');
        }
      },
      onError: (error) {
        print('WebSocket error: $error');
        _videoStreamController.addError(error);
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
  Stream<Uint8List> get videoStream => _videoStreamController.stream;

  // Getter for detection results stream
  Stream<String> get detectionResultsStream =>
      _detectionResultsController.stream;

  // Attempt to reconnect on connection loss
  void _attemptReconnect(String url) {
    Future.delayed(Duration(seconds: 5), () {
      if (!_videoStreamController.isClosed) {
        print('Attempting to reconnect to WebSocket...');
        WebSocketService(url); // Reconnect by creating a new instance
      }
    });
  }

  // Dispose method to close resources
  void dispose() {
    _videoStreamController.close();
    _detectionResultsController.close();
    _channel.sink.close();
  }
}
