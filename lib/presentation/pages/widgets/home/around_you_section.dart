import 'package:flutter/material.dart';

class AroundYouSection extends StatelessWidget {
  const AroundYouSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Around You",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Explore events around you that are happening right now",
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 150,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const Card(
                  child: SizedBox(
                    width: 150,
                    height: 150,
                  ),
                );
              },
              separatorBuilder: (context, _) {
                return const SizedBox(
                  width: 12,
                );
              },
              itemCount: 10),
        ),
      ],
    );
  }
}
