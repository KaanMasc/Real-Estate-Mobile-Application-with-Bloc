import 'dart:async';
import 'package:api/features/authentication/register/cubit/register_cubit.dart';
import 'package:api/features/authentication/sign_in/sign_in_page.dart';
import 'package:api/features/authentication/widgets/auth_background.dart';
import 'package:api/features/authentication/widgets/custom_email_field.dart';
import 'package:api/features/authentication/widgets/custom_password_field.dart';
import 'package:api/features/authentication/widgets/real_estate_logo.dart';
import 'package:api/features/authentication/widgets/register_button.dart';
import 'package:api/features/main_page/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/toast_message.dart';
import '../../../product/widgets/register_complete_animation.dart';
import '../widgets/auth_option_text.dart';
import '../widgets/custom_fullname_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<RegisterPage> {
  late final TextEditingController _fullNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _passwordConfirmController;

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordConfirmController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SignInForm(
      fullNameController: _fullNameController,
      emailController: _emailController,
      passwordController: _passwordController,
      passwordConfirmController: _passwordConfirmController,
      formKey: _formKey,
    );
  }
}

class SignInForm extends StatelessWidget {
  const SignInForm({
    Key? key,
    required this.formKey,
    required this.fullNameController,
    required this.emailController,
    required this.passwordController,
    required this.passwordConfirmController,
  }) : super(key: key);
  final GlobalKey<FormState> formKey;
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController passwordConfirmController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (BuildContext context, state) {
          if (state is RegisterSuccesState) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const RegisterCompleteAnimatoion();
              },
            );

            Future.delayed(const Duration(seconds: 3), () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MainPage()),
              );
            });
          }
          if (state is RegisterErrorState) {
            ToastMesage.showToast(state.errorMessage);
          } else if (state is RegisterLoadingState) {
            const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
        builder: (BuildContext context, Object? state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                const BackgroundFiltered(),
                Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Spacer(),
                      const RealEstateWelcome(),
                      const SizedBox(height: 20),
                      CustomFullNameField(controller: fullNameController),
                      const SizedBox(height: 20),
                      CustomEmailField(controller: emailController),
                      const SizedBox(height: 20),
                      CustomPasswordField(controller: passwordController),
                      const SizedBox(height: 20),
                      CustomPasswordField(controller: passwordConfirmController),
                      TextButton(
                        child: const Text('Forgot your Password?'),
                        onPressed: () {},
                      ),
                      const SizedBox(height: 20),
                      RegisterButton(
                        formKey: formKey,
                        emailController: emailController,
                        passwordController: passwordController,
                        fullNameController: fullNameController,
                        passwordConfirmController: passwordConfirmController,
                      ),
                      const Spacer(),
                      AuthOptionText(
                          primaryText: 'Already have an account ?',
                          actionText: 'Login',
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => const SignInPage()));
                          })
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
