
import 'package:api/product/enums/colors.dart';
import 'package:flutter/material.dart';

class FavoritesText extends StatelessWidget {
  const FavoritesText({super.key});
  final String title = 'Favorite List';
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w500,
            color: ProjectColors.textColor.color,
            letterSpacing: 2),
      ),
    );
  }
}
