import 'package:flutter/material.dart';

class MenuIcon extends StatelessWidget {
  const MenuIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.menu,
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.url,
  });
  final String url;
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.network(
        url,
        width: 36,
      ),
    );
  }
}

class GeneralSpacer extends StatelessWidget {
  const GeneralSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
    );
  }
}

class StrokeText extends StatelessWidget {
  const StrokeText({
    super.key,
    required this.text,
    this.fontSize = 48,
    this.fontWeight = FontWeight.w900,
    this.color = Colors.white,
    this.strokeWidth = 4,
    this.strokeColor = const Color(0xFF202023),
  });
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final double strokeWidth;
  final Color strokeColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            foreground: Paint()..color = color,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            foreground: Paint()
              ..strokeWidth = strokeWidth
              ..color = strokeColor
              ..style = PaintingStyle.stroke,
          ),
        ),
      ],
    );
    ;
  }
}
