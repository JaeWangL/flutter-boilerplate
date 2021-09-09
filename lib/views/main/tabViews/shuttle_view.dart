import 'package:flutter/material.dart';

class ShuttleView extends StatelessWidget {
  const ShuttleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.amber,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [const Text('Shuttle Page')]),
    );
  }
}
