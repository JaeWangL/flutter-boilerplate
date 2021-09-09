import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.amber,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [const Text('Settings Page')]),
    );
  }
}
