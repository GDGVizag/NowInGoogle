import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      required this.label,
      required this.onPressed,
      this.primaryColor = const Color(0xFF4285F4),
      this.onPrimaryColor = Colors.white,
      this.suffix});

  final String label;
  final Function()? onPressed;
  final Widget? suffix;
  final Color primaryColor;
  final Color onPrimaryColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 18),
          foregroundColor: onPrimaryColor,
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.normal, color: onPrimaryColor),
            ),
            if (suffix != null)
              SizedBox(
                width: 16,
              ),
            if (suffix != null) suffix!
          ],
        ),
      ),
    );
  }
}
