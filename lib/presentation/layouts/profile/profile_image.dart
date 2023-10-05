import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String image;
  final String avatar;
  const ProfileImage({super.key, required this.image, required this.avatar});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        height: 128,
        width: 128,
        child: Stack(
          children: [
            Center(
              child: Image.network(
                image,
                height: 110,
                width: 110,
                fit: BoxFit.cover,
              ),
            ),
            Image.asset(
              avatar,
              height: 128,
              width: 128,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
