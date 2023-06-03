import 'package:flutter/material.dart';
import 'package:nowingoogle/widgets/functions.dart';

class HeadingOne extends StatelessWidget {
  const HeadingOne(
      {super.key,
      required this.child,
      this.color = Colors.black,
      this.size = 24});
  final String child;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      child,
      style: getTextStyle(color: color, size: size),
    );
  }
}

class HeadingTwo extends StatelessWidget {
  const HeadingTwo(
      {super.key,
      required this.child,
      this.color = Colors.black,
      this.size = 18});
  final String child;
  final Color color;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Text(
      child,
      style: getTextStyle(color: color, size: size),
    );
  }
}

class HeadingThree extends StatelessWidget {
  const HeadingThree(
      {super.key,
      required this.child,
      this.color = Colors.black,
      this.size = 16});
  final String child;
  final Color color;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Text(
      child,
      style: getTextStyle(color: color, size: size),
    );
  }
}
