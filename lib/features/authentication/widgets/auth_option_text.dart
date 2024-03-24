
import 'package:flutter/material.dart';

class AuthOptionText extends StatelessWidget {
  const AuthOptionText({
    super.key,
    required this.primaryText,
    required this.actionText,
    required this.onTap,
  });
  final String primaryText;
  final String actionText;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: GestureDetector(
          onTap: onTap,
          child: RichText(
            text: TextSpan(
              text: primaryText,
              style: const TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: actionText,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
