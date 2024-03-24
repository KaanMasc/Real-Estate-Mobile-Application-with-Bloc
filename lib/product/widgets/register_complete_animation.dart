import 'dart:async';

import 'package:api/features/authentication/register/cubit/register_cubit.dart';
import 'package:api/features/authentication/sign_in/sign_in_page.dart';
import 'package:api/product/utility/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class RegisterCompleteAnimatoion extends StatelessWidget {
  const RegisterCompleteAnimatoion({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      elevation: 30,
      content: SizedBox(
        width: double.infinity,
        height: AppSizes.screenHeight*0.75,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                width: 300,
                child: Lottie.asset('assets/animations/register_complete.json'),
              ),
              Text(
                'You are being redirected to the login page.',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
