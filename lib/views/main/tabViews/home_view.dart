import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/widgets/index.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundImageView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [const Text('Home Page')]),
    );
  }
}
