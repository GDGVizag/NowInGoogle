import 'package:flutter/material.dart';
import 'package:nowingoogle/data/datasources/sample_data/sample_blogs.dart';
import 'package:nowingoogle/presentation/pages/widgets/home/posts/post_card.dart';
import 'package:nowingoogle/presentation/pages/widgets/home/posts/post_card_top.dart';
import 'package:nowingoogle/presentation/pages/widgets/home/posts/post_recommendations_from_network.dart';

class TopReadsSection extends StatelessWidget {
  const TopReadsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Top Reads",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Top stories just for you. Read them now!",
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        const PostCardTop(),
        const SizedBox(
          height: 16,
        ),
        ListView.separated(
          itemBuilder: (context, index) {
            return PostCard(post: blogs[index]);
          },
          separatorBuilder: (context, index) {
            return index % 3 == 2
                ? const PostRecommendationsFromNetwork()
                : const SizedBox(
                    height: 16,
                  );
          },
          itemCount: blogs.length,
          primary: false,
          shrinkWrap: true,
        ),
      ],
    );
  }
}
