import 'package:flutter/material.dart';
import 'package:rick_and_morty_and_flutter/persistence/offline_themes/flutter_atari_theme.dart';
import 'package:rick_and_morty_and_flutter/persistence/strings/global_strings.dart';
import 'package:rick_and_morty_and_flutter/presentation/welcome_screen/welcome_screen.dart';

// Hi there.
// Here is a quick review of the app and its structure.

//* Main features:

// - Character list and character detailed view.

// - Episodes list and episode detailed view.

// - Character search by name.

//* Folder structure:

// blocs: Contains the "blocs" that are used for the three main features of the app.

// models: Contains the files that map JSON data to DART code.

// persistance: Contains files that are used within the full app.

// presentation: Contains the UI (User Interface)

// repository: Contains the files that make the requests to the API

//* About the app:

// The app uses a Business Logic Component (BloC) approach
// to manage the state.

// The "Blocs" are used in the main features of the app.

// BloC manages mainly the network layer.

// Some of the files will have comments clarifying some details. Enjoy!

//! The app starts here.
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
