import 'package:flutter/material.dart';

class BackgroundImageView extends StatelessWidget {
  final Widget child;

  const BackgroundImageView({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_main.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: child,
      ),
    );
  }
}
