import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/widgets/index.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundImageView(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        GradientText(
          'Message Test',
          colors: const [
            Colors.blue,
            Colors.red,
          ],
          style: const TextStyle(fontSize: 42, fontWeight: FontWeight.w700),
        ),
        GradientText(
          'Secondary Message',
          colors: const [
            Colors.purple,
            Colors.orange,
          ],
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
        )
      ]),
    );
  }
}
