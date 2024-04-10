import 'package:api/product/utility/app_sizes.dart';
import 'package:flutter/material.dart';

class PostAdDirectionText extends StatelessWidget {
  const PostAdDirectionText({super.key, required this.directionText});
  final String directionText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.screenHeight / 10,
      width: AppSizes.screenWidth,
      child: Text(directionText, style: Theme.of(context).textTheme.headlineMedium,),
    );
  }
}
