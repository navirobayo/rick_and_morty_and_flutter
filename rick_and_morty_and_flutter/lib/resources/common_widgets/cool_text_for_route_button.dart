import 'package:flutter/material.dart';

class CoolTextForRouteButton extends StatelessWidget {
  const CoolTextForRouteButton({
    super.key,
    required this.text,
    required this.context,
  });

  final String text;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontSize: 15,
      ),
    );
  }
}
