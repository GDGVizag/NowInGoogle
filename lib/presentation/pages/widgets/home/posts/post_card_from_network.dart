import 'package:flutter/material.dart';

class PostCardFromNetwork extends StatelessWidget {
  const PostCardFromNetwork({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        width: 280,
        child: Column(children: [
          Image.network(
            "https://cdn-images-1.medium.com/fit/t/1600/480/1*rtPw9vMKV31rckXABZqKPA.png",
            height: 100,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Locale changes and the AndroidViewModel antipattern",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Jose Alcerra",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "April 02 • 1 min read",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
