import 'package:flutter/material.dart';

class EXT {}

extension CustomContext on BuildContext {
  double screenHeight([double percent = 1]) =>
      MediaQuery.of(this).size.height * percent;

  double screenWidth([double percent = 1]) =>
      MediaQuery.of(this).size.width * percent;
}

extension PostFrameCallback on VoidCallback {
  void withPostFrameCallback() =>
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        this();
      });
}
