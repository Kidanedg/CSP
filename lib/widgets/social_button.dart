import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const SocialButton({
    super.key,
    required this.text,
    required this.icon,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: foregroundColor ?? Theme.of(context).colorScheme.primary,
        ),
        label: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: foregroundColor ?? Theme.of(context).colorScheme.primary,
          ),
        ),
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
