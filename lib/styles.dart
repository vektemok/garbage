import 'package:flutter/material.dart';
import 'package:flutter_application_2/color_pallet.dart';

/// {@template styles}
/// DarkStyles.
/// {@endtemplate}
final class Styles extends ChangeNotifier {
  /// {@macro styles}

  Styles._();

  static final Styles instance = Styles._();

  /// Make parametr optinal.
  ///
  /// Todo: TextStyle myStyle([Color? olors]){ ... your realisation}
  static TextStyle textStyle([Color? color]) {
    return TextStyle(color: (color != null) ? ColorPallet.darkColor : color);
  }

  void lightTrigger() {
    textStyle().copyWith();
    notifyListeners();
  }

  void darkTrigger() {
    textStyle().copyWith(color: Colors.black);

    notifyListeners();
  }
}
