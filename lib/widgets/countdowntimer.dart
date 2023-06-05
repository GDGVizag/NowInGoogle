import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nowingoogle/widgets/functions.dart';

class CountdownTimer extends StatefulWidget {
  final Color primaryColor;
  final Color onPrimaryColor;
  const CountdownTimer({
    super.key,
    required this.primaryColor,
    required this.onPrimaryColor,
  });

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  var differnceTimeStamp =
      DateTime(2023, 8, 5, 6, 0).difference(DateTime.now()).inSeconds;

  void updateTimeStamp() {
    setState(() {
      Future.delayed(Duration(seconds: 1), () {
        differnceTimeStamp = max(
            DateTime(2023, 8, 5, 6, 0).difference(DateTime.now()).inSeconds,
            DateTime.now().difference(DateTime.now()).inSeconds);
        updateTimeStamp();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    updateTimeStamp();
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(width: 1.5),
          color: widget.primaryColor,
          borderRadius: BorderRadius.circular(12.0)),
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          Text(
            "${doubleDigit((differnceTimeStamp / 86400).floor())}:${doubleDigit(((differnceTimeStamp % 86400) / 3600).floor().round())}:${doubleDigit((((differnceTimeStamp % 86400) % 3600) / 60).floor().round())}:${doubleDigit((((differnceTimeStamp % 86400) % 3600) % 60).floor().round())}",
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..color = widget.onPrimaryColor
                    ..strokeWidth = 1.0,
                ),
          ),
          Text(
            "days: hours : minutes : seconds",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: widget.onPrimaryColor),
          ),
        ],
      ),
    );
  }
}
