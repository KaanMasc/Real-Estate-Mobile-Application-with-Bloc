import 'package:api/product/enums/colors.dart';
import 'package:api/product/utility/app_sizes.dart';
import 'package:flutter/material.dart';

class PostQuestionBox extends StatelessWidget {
  const PostQuestionBox({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.screenHeight / 10,
      width: AppSizes.screenWidth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: ProjectColors.white.color),
      child: Center(
          child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(fontWeight: FontWeight.w600),
      )),
    );
  }
}
