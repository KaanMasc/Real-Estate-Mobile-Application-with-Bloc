import 'package:api/product/enums/colors.dart';
import 'package:api/product/utility/app_sizes.dart';
import 'package:flutter/material.dart';

class PostAdButton extends StatefulWidget {
  const PostAdButton({super.key, required this.text, required this.categoryId});
  final String text;
final String categoryId;
  @override
  State<PostAdButton> createState() => _PostAdButtonState();
}

class _PostAdButtonState extends State<PostAdButton> {
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: AppSizes.screenHeight / 15,
          width: AppSizes.screenWidth,
          decoration: BoxDecoration(
            color: _isActive
                ? ProjectColors.indiaGreen.color
                : ProjectColors.pagecolor.color,
            borderRadius: BorderRadius.circular(25),
          ),
          child: TextButton(
            onPressed: () {
              setState(() {
                _isActive = !_isActive;
              });
            },
            child: Text(
              widget.text,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: _isActive
                      ? ProjectColors.white.color
                      : ProjectColors.black.color),
            ),
          ),
        ),
        const SizedBox(height: 12)
      ],
    );
  }
}
