import 'package:flutter/material.dart';
import 'package:nowingoogle/presentation/pages/widgets/home/posts/post_card_from_network.dart';

class PostRecommendationsFromNetwork extends StatelessWidget {
  const PostRecommendationsFromNetwork({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.verified,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "From people you follow",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Text("Select reads from the peple you follow"),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 280,
            child: ListView.separated(
              itemBuilder: (context, networkPostIndex) {
                return const PostCardFromNetwork();
              },
              separatorBuilder: (context, _) {
                return const SizedBox(
                  width: 12,
                );
              },
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              primary: false,
            ),
          ),
        ],
      ),
    );
  }
}
