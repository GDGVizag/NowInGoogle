import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nowingoogle/data/utils/number_utils.dart';

class CountdownTimer extends StatefulWidget {
  final int eventDate;
  final Color primaryColor;
  final Color onPrimaryColor;
  const CountdownTimer({
    super.key,
    required this.eventDate,
    required this.primaryColor,
    required this.onPrimaryColor,
  });

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  int differnceTimeStamp = 0;

  void updateTimeStamp() {
    setState(() {
      Future.delayed(const Duration(seconds: 1), () {
        differnceTimeStamp = max(
            DateTime.fromMicrosecondsSinceEpoch(widget.eventDate)
                .difference(DateTime.now())
                .inSeconds,
            DateTime.now().difference(DateTime.now()).inSeconds);
        updateTimeStamp();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    differnceTimeStamp = DateTime.fromMicrosecondsSinceEpoch(widget.eventDate)
        .difference(DateTime.now())
        .inSeconds;
  }

  @override
  Widget build(BuildContext context) {
    updateTimeStamp();
    return Column(
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
    );
  }
}
