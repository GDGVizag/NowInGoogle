import 'package:flutter/material.dart';

class PostCardTop extends StatelessWidget {
  const PostCardTop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            "https://cdn-images-1.medium.com/v2/resize:fill:1600:480/gravity:fp:0.5:0.4/1*jsgqunQ5DuF5GFAbn3hDwg.png",
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          "Locale changes and the AndroidViewModel antipattern",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "Jose Alcerra",
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Text(
          "April 02 • 1 min read",
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
