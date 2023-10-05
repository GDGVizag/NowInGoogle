import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nowingoogle/data/datasources/sample_data/sample_interests.dart';
import 'package:nowingoogle/presentation/pages/widgets/home/interest_chip.dart';

class InterestsSelectionSection extends StatelessWidget {
  const InterestsSelectionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Your interests",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Updates from topics you follow will appear here. Follow some to get started.",
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          width: double.infinity,
          height: 92,
          child: MasonryGridView.count(
            scrollDirection: Axis.horizontal,
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            itemBuilder: (context, index) {
              return InterestChip(
                interest: interests[index],
                image: interestsIcon[index],
              );
            },
            itemCount: interests.length,
          ),
        ),
      ],
    );
  }
}
