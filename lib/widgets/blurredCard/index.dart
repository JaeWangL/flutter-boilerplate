import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredCard extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color backgroundColor;
  final BorderRadius? borderRadius;

  const BlurredCard(
      {Key? key,
      required this.child,
      this.width,
      this.height,
      this.padding,
      this.margin,
      this.backgroundColor = const Color.fromRGBO(255, 255, 255, 0.6),
      this.borderRadius = const BorderRadius.all(Radius.circular(20.0))})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
      ),
      child: ClipRRect(borderRadius: borderRadius, child: child),
    );
  }
}
