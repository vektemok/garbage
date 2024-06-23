import 'package:flutter/material.dart';
import 'package:flutter_application_2/color_pallet.dart';
import 'package:flutter_application_2/styles.dart';

/// {@template theme_wrapper}
/// ThemeWrapper widget.
/// {@endtemplate}
class ThemeWrapper extends StatefulWidget {
  /// {@macro theme_wrapper}
  const ThemeWrapper({
    required this.child,
    super.key, // ignore: unused_element
  });

  final Widget child;

  /// The state from the closest instance of this class
  /// that encloses the given context, if any.

  static ThemeWrapperState? maybeOf(BuildContext context) =>
      context.findAncestorStateOfType<ThemeWrapperState>();

  @override
  State<ThemeWrapper> createState() => ThemeWrapperState();
}

/// State for widget ThemeWrapper.
class ThemeWrapperState extends State<ThemeWrapper> {
  /* #region Lifecycle */

  @override
  void initState() {
    super.initState();
    // Initial state initialization
  }

  @override
  void didUpdateWidget(covariant ThemeWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Widget configuration changed
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // The configuration of InheritedWidgets has changed
    // Also called after initState but before build
  }

  @override
  void dispose() {
    // Permanent removal of a tree stent
    super.dispose();
  }

  /* #endregion */

  ThemeMode _themeMode = ThemeMode.light;

  void changeTheme() {
    if (_themeMode == ThemeMode.light) {
      setState(() {
        _themeMode = ThemeMode.dark;
        Styles.instance.darkTrigger();
        ColorPallet.instance.darkTrigger();
      });
    } else {
      setState(() {
        _themeMode = ThemeMode.light;

        Styles.instance.lightTrigger();
        ColorPallet.instance.lightTrigger();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ThemeScope(themeMode: _themeMode, child: widget.child);
  }
}

/// {@template theme_wrapper}
/// ThemeScope widget.
/// {@endtemplate}
class ThemeScope extends InheritedWidget {
  /// {@macro theme_wrapper}
  const ThemeScope({
    required this.themeMode,
    required super.child,
    super.key, // ignore: unused_element
  });

  static ThemeScope of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeScope>()!;
  }

  final ThemeMode themeMode;
  @override
  bool updateShouldNotify(ThemeScope oldWidget) {
    return themeMode != oldWidget.themeMode;
  }
}
