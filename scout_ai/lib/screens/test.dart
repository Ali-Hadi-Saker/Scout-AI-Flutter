// import 'package:flutter/material.dart';
// import 'package:flutter_vlc_player/flutter_vlc_player.dart';
// import 'package:screenshot/screenshot.dart';
// import 'package:flutter_mjpeg/flutter_mjpeg.dart';



// class TestScreen extends StatefulWidget {
//   @override
//   _TestScreenState createState() => _TestScreenState();
// }

// class _TestScreenState extends State<TestScreen> {
//   ScreenshotController screenshotController = ScreenshotController();

//   @override
//   // void initState() {
//   //   super.initState();
//   //   _vlcPlayerController = VlcPlayerController.network(
//   //     'http://192.168.0.107',  // Replace with the ESP32 IP address
//   //     hwAcc: HwAcc.full,
//   //     autoPlay: true,
//   //     options: VlcPlayerOptions(),
//   //   );
//   // }

//   @override
//   // void dispose() {
//   //   _vlcPlayerController.dispose();
//   //   super.dispose();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('ESP32 Camera Stream'),
//       ),
//       body: Container(
//           height: MediaQuery.of(context).size.width,
//           width: MediaQuery.of(context).size.width,
//           decoration: BoxDecoration(
//               borderRadius:
//                   BorderRadius.all(Radius.circular(10))),
//           child: Screenshot(
//             controller: screenshotController,
//             child: Mjpeg(
//   stream: 'http://172.20.10.3',
//   isLive: true,
//   error: (BuildContext context, dynamic error, dynamic stackTrace) {
//     print("Error loading stream: $error");
//     return Container(
//       decoration: BoxDecoration(
//           color: Colors.grey,
//           borderRadius: BorderRadius.all(Radius.circular(10))),
//       child: Center(
//         child: Text(
//           'No stream found',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//     );
//   },
// ),
//           )),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  late VlcPlayerController _vlcPlayerController;

  @override
  void initState() {
    super.initState();
    _vlcPlayerController = VlcPlayerController.network(
      'http://172.20.10.3',  // Correct URL and port
      hwAcc: HwAcc.full,
      autoPlay: true,
    );
  }

  @override
  void dispose() {
    _vlcPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ESP32 Camera Stream'),
      ),
      body: VlcPlayer(
        controller: _vlcPlayerController,
        aspectRatio: 16 / 9,
        placeholder: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

