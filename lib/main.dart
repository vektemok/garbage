import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/styles.dart';
import 'package:flutter_application_2/theme_wrapper.dart';


void main([List<String>? args]) => runZonedGuarded<Future<void>>(() async {
      runApp(const HomeScreen());
    }, (error, stackTrace) {
      //Error.safeToString(error);
      //stackTrace.toString();
      print('Error: error, stackTrace: stackTrace');
    });

/// {@template main}
/// HomeScreen widget.
/// {@endtemplate}
class HomeScreen extends StatelessWidget {
  /// {@macro main}
  const HomeScreen({
    super.key, // ignore: unused_element
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      child: Builder(
        builder: (context) {
          return MaterialApp(
            theme: ThemeData(scaffoldBackgroundColor: Colors.black),
            darkTheme: ThemeData(scaffoldBackgroundColor: Colors.white),
            themeMode: ThemeScope.of(context).themeMode,
            home: Builder(builder: (context) {
              return Scaffold(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                body: ListenableBuilder(
                    listenable: Styles.instance,
                    builder: (context, widget) {
                      return SafeArea(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Your text',
                                style: Styles.textStyle(Colors.cyan),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    ThemeWrapper.maybeOf(context)!
                                        .changeTheme();
                                  },
                                  child: const Text('Change theme'))
                            ],
                          ),
                        ),
                      );
                    }),
              );
            }),
          );
        },
      ),
    );
  }
}
