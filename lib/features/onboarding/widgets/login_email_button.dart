import 'package:api/features/authentication/register/register_page.dart';
import 'package:api/product/enums/colors.dart';
import 'package:api/product/utility/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginEmailButton extends StatelessWidget {
  const LoginEmailButton({super.key});
  final String _text = 'EMAIL';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.screenWidth / 8,
      width: AppSizes.screenWidth / 4,
      decoration: BoxDecoration(
          color: ProjectColors.black.color,
          borderRadius: BorderRadius.circular(30)),
      child: TextButton(
        onPressed: () {
          _navigateRegisterPage(context);
          _isFirstTimeSave(context);
        },
        child: Text(
          _text,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: ProjectColors.white.color, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  void _navigateRegisterPage(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const RegisterPage()));
  }

  void _isFirstTimeSave(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isFirstTime', false);
  }
}
