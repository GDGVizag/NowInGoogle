import 'package:flutter/material.dart';

TextStyle getTextStyle({Color color = Colors.black, double size = 24}) {
  return TextStyle(color: color, fontSize: size);
}

String doubleDigit(int digit) {
  if (digit > 9)
    return digit.toString();
  else
    return '0$digit';
}
