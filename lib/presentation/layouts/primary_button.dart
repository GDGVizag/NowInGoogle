import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.primaryColor = const Color(0xFF4285F4),
    this.onPrimaryColor = Colors.white,
    this.buttonStyle,
    this.suffix,
  });

  final String label;
  final Color primaryColor;
  final Color onPrimaryColor;
  final Function() onPressed;
  final Widget? suffix;
  final ButtonStyle? buttonStyle;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: buttonStyle ??
          FilledButton.styleFrom(
            foregroundColor: onPrimaryColor,
            backgroundColor: primaryColor,
          ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: onPrimaryColor),
          ),
          SizedBox(
            width: suffix != null ? 12 : 0,
          ),
          suffix ?? const SizedBox(),
        ],
      ),
    );
  }
}
