import 'package:api/product/enums/colors.dart';
import 'package:api/product/utility/app_sizes.dart';
import 'package:flutter/material.dart';

class LoginSocialButton extends StatelessWidget {
  const LoginSocialButton({super.key, required this.icon, required this.onPressed, });
  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.screenWidth / 8,
      width: AppSizes.screenWidth / 8,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: ProjectColors.black.color),
      child: IconButton(
        onPressed: onPressed,
          icon: Icon(
            icon,
            color: ProjectColors.white.color,
          )),
    );
  }
}
