import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavIcon extends StatelessWidget {
  final String source;
  final bool isActive;

  const BottomNavIcon({Key? key, required this.source, this.isActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      source,
      width: 26,
      height: 26,
      color: isActive ? Colors.blue : Colors.red,
    );
  }
}
