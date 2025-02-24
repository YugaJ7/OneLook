import 'package:flutter/material.dart';

@immutable
class ButtonStyles {

  static var primary = ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
    backgroundColor: Color(0xFF585CE5),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
    side: BorderSide(
      color: const Color(0xFF585CE5),
      width: 1
      )
    ),
    elevation: 0
  );
}