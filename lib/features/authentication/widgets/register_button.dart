import 'package:api/features/authentication/register/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import '../../../core/toast_message.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.fullNameController,
    required this.passwordConfirmController,
    
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController fullNameController;

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController passwordConfirmController;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:   () {
              if (formKey.currentState!.validate()) {
                FocusScope.of(context).unfocus();

                String fullName = fullNameController.text;
                String email = emailController.text;
                String password = passwordController.text;
                String confirmPassword = passwordConfirmController.text;

                if (password == confirmPassword) {
                  RegisterCubit.get(context).registerUser(
                    fullName: fullName,
                    email: email,
                    password: password,
                  );
                } else {
                  // Şifreler eşleşmediği durumda kullanıcıya bilgi ver
                  ToastMesage.showToast('Passwords do not match. Please try again.');
                }
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
      child: const Text('Register'),
    );
  }
}
