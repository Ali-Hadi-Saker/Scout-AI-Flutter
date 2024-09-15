import 'package:flutter/material.dart';

class AppColors {
  static const LinearGradient primaryButtonGradient = LinearGradient(
    colors: [
      Color(0xFF6389BE), 
      Color(0xFF2E4058), 
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient logoutButtonGradient = LinearGradient(
    colors: [
      Color(0xFFF36B6B),
      Color(0xFF8B0000),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Color bgColor = Color.fromRGBO(246, 246, 246, 1); 
}
