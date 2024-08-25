import 'package:flutter/material.dart';

class ScreenIcon extends StatelessWidget {
  final Icon screenIon;
  const ScreenIcon({super.key, required this.screenIon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        backgroundColor: Colors.grey[400],
        radius: 40,
        child: Icon(
          screenIon.icon,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
