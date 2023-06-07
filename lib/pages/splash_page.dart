import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nowingoogle/pages/home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomePage()));
    });
    return Scaffold(
      body: Column(children: [
        const Spacer(),
        Transform.translate(
          offset: const Offset(0, 54),
          child: Container(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  "assets/io-logo.svg",
                  width: 100,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : null,
                ),
                Text(
                  "I/O '23\nExtended",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Row(
                  children: [
                    Text(
                      "August 5, 2023",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      "Vizag",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.color
                              ?.withOpacity(0.5)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            "assets/io-bridge.png",
          ),
        ),
      ]),
    );
  }
}
