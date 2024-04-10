import 'package:api/product/utility/app_sizes.dart';
import 'package:flutter/material.dart';
import '../../../product/utility/paddings.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    Key? key,
    required this.onpressed,
    required this.text,
  }) : super(key: key);
  final VoidCallback onpressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.screenHeight / 12,
      width: AppSizes.screenWidth,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: ProjectPaddings.horizontalMedium,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text),
              IconButton(onPressed: onpressed, icon: const Icon(Icons.chevron_right_rounded))
            ],
          ),
        ),
      ),
    );
  }
}
