import 'package:flutter/material.dart';

class DietView extends StatelessWidget {
  const DietView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.amber,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [const Text('Diet Page')]),
    );
  }
}
