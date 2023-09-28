import 'package:flutter/material.dart';
import 'package:rick_and_morty_and_flutter/resources/offline_themes/flutter_atari_theme.dart';
import 'package:rick_and_morty_and_flutter/resources/strings/global_strings.dart';
import 'package:rick_and_morty_and_flutter/ui/home_screen/home_screen.dart';
import 'package:rick_and_morty_and_flutter/ui/welcome_screen/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: FlutterAtariTheme.lightTheme,
      darkTheme: FlutterAtariTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(title: appName),
    );
  }
}
