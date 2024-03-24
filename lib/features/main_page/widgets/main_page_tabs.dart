import 'package:flutter/material.dart';

class MainPageTabs extends StatelessWidget {
  const MainPageTabs({super.key, required this.icon, required this.text});
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: Icon(
        icon,
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }
}
