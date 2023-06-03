import 'package:flutter/material.dart';

class MenuIcon extends StatelessWidget {
  const MenuIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.menu,
      size: 30,
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
        width: 48,
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
