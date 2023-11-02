import 'package:flutter/material.dart';
import 'package:rick_and_morty_and_flutter/persistence/strings/global_strings.dart';
import 'package:rick_and_morty_and_flutter/presentation/home_screen/home_screen.dart';
import 'package:rick_and_morty_and_flutter/persistence/rick_and_morty_custom_icons/ra_m_custom_icons_icons.dart';
import 'package:rick_and_morty_and_flutter/presentation/home_screen/new_home_screen.dart';
import 'package:rick_and_morty_and_flutter/presentation/one/one.dart';

//* Welcome screen.

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: const Text(appName),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            SizedBox(height: 200, child: Image.asset("images/cover.png")),
            SizedBox(
              width: 300,
              child: TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter a username',
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final username = _nameController.text;
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => One(
                username: username,
              ),
            ),
          );
        },
        child: const Icon(RaMCustomIcons
            .mortyface1), //! A personalized icon that I think looks cool.
      ),
    );
  }
}
