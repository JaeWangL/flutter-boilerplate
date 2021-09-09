import 'package:flutter/material.dart';

class NoticesView extends StatelessWidget {
  const NoticesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.amber,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [const Text('Notices Page')]),
    );
  }
}
