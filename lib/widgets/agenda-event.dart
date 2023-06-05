// import 'package:flutter/material.dart';
// import 'package:nowingoogle/widgets/textwidgets.dart';

// class AgendaTile extends StatelessWidget {
//   const AgendaTile(
//       {super.key,
//       required this.time,
//       required this.title,
//       required this.subtitle});
//   final String time;
//   final String title;
//   final String subtitle;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         HeadingThree(
//           child: time,
//           color: Theme.of(context).colorScheme.primary,
//           size: 24,
//         ),
//         SizedBox(
//           width: 20,
//         ),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             HeadingOne(
//               child: title,
//               size: 16,
//             ),
//             HeadingThree(
//               child: subtitle,
//               size: 14,
//             )
//           ],
//         )
//       ],
//     );
//   }
// }
