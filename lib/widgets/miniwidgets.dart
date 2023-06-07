import 'package:flutter/material.dart';

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
    return const SizedBox(
      height: 24,
    );
  }
}
