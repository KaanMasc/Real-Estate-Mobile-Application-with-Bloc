import 'package:flutter/material.dart';

class TermsAndPolicyText extends StatelessWidget {
  const TermsAndPolicyText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: const TextSpan(children: [
      TextSpan(
        text: "By signing up, you're agree to our ",
        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
      ),
      TextSpan(
          text: " Terms & Conditions",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
      TextSpan(
        text: "  and ",
        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
      ),
      TextSpan(
          text: "  Privacy Policy",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
    ]));
  }
}
