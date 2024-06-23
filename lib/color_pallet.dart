import 'package:flutter/material.dart';

/// {@template color_pallet}
/// LightColorPallet.
/// {@endtemplate}
final class ColorPallet extends ChangeNotifier {
  /// {@macro color_pallet}

  ColorPallet._();

  static final ColorPallet instance = ColorPallet._();
  static Color darkColor = Colors.black;
  void lightTrigger() {
    darkColor = Colors.red;
    notifyListeners();
  }

  void darkTrigger() {
    darkColor = Colors.green;
  }
}
