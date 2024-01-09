import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Spacer(),
          Text("Powered by the Rick and Morty API:"),
          Text("https://rickandmortyapi.com/"),
          Text("Created with Flutter"),
          Spacer(),
          SizedBox(height: 200, child: Image.asset("images/cover2.png")),
          Spacer(),
          Text("Source code:"),
          Text("https://github.com/navirobayo"),
          Spacer(),
        ],
      ),
    ));
  }
}
