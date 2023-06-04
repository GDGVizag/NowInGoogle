import 'package:flutter/material.dart';
import 'package:nowingoogle/utils/capitalize.dart';

class CustomListView extends StatelessWidget {
  final Map<dynamic, dynamic> list;
  const CustomListView({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: list.entries
            .map(
              (e) => CustomListViewItem(
                title: e.key.toString().replaceAll("_", " "),
                value: e.value.runtimeType == List
                    ? (e.value as List<dynamic>).join(", ")
                    : e.value.toString(),
              ),
            )
            .toList(),
      ),
    );
  }
}

class CustomListViewItem extends StatelessWidget {
  final String title;
  final String value;
  const CustomListViewItem(
      {super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          capitalize(title),
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
        Text(value),
        const SizedBox(height: 16),
      ],
    );
  }
}
