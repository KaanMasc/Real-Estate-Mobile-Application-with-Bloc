import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../sign_in/cubit/signin_cubit.dart';

class CustomSignInButton extends StatelessWidget {
  const CustomSignInButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: context.watch<SignInCubit>().isLoading
          ? null
          : () {
              if (formKey.currentState!.validate()) {
                FocusScope.of(context).unfocus();
                SignInCubit.get(context).userLogin(
                  email: emailController.text,
                  password: passwordController.text,
                );
              }
            },
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      child: const Text('Login'),
    );
  }
}
