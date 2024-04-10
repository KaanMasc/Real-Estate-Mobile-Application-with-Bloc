import 'package:api/product/enums/colors.dart';
import 'package:api/product/utility/app_sizes.dart';
import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({super.key, required this.onPressed});
  final VoidCallback onPressed;
  final String _title = 'Add Location';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.screenHeight/20,
        width: AppSizes.screenWidth/2,
        
        decoration: BoxDecoration(
            color: ProjectColors.orange.color, borderRadius: BorderRadius.circular(25)),
        child: TextButton(
          onPressed: onPressed,
          child: Text(_title, style: Theme.of(context).textTheme.bodyMedium),
        ));
  }
}
