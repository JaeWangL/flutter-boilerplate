import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/styles/index.dart';
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
      width: 28,
      height: 28,
      color: isActive ? AppColors.primary : AppColors.gray400,
    );
  }
}
