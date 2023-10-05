import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InterestChip extends StatefulWidget {
  final String interest;
  final String image;
  const InterestChip({
    super.key,
    required this.interest,
    required this.image,
  });

  @override
  State<InterestChip> createState() => _InterestChipState();
}

class _InterestChipState extends State<InterestChip> {
  var selected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: selected
                ? Theme.of(context).colorScheme.onPrimaryContainer
                : null,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              widget.image.contains(".svg")
                  ? SvgPicture.network(
                      widget.image,
                      height: 12,
                      colorFilter: ColorFilter.mode(
                        selected
                            ? Theme.of(context).colorScheme.primaryContainer
                            : Theme.of(context).colorScheme.onBackground,
                        BlendMode.srcIn,
                      ),
                    )
                  : Image.network(
                      widget.image,
                      height: 14,
                      color: selected
                          ? Theme.of(context).colorScheme.primaryContainer
                          : Theme.of(context).colorScheme.onBackground,
                      colorBlendMode: BlendMode.srcIn,
                    ),
              const SizedBox(
                width: 12,
              ),
              Text(
                widget.interest,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: selected
                          ? Theme.of(context).colorScheme.primaryContainer
                          : null,
                    ),
              ),
              const SizedBox(
                width: 12,
              ),
              Icon(
                selected ? Icons.check_circle : Icons.add_rounded,
                size: 16,
                color: selected
                    ? Theme.of(context).colorScheme.primaryContainer
                    : null,
              ),
            ],
          )),
    );
  }
}
