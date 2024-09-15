import 'package:flutter/material.dart';

class AppColors {
  static const LinearGradient primaryButtonGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 67, 123, 245),
      Color.fromARGB(255, 45, 105, 235),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient logoutButtonGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 240, 36, 36),
      Color.fromARGB(255, 210, 20, 20),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
