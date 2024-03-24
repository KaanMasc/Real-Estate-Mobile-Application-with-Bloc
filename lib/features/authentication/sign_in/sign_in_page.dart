import 'package:api/core/toast_message.dart';
import 'package:api/features/authentication/register/register_page.dart';
import 'package:api/features/authentication/widgets/auth_background.dart';
import 'package:api/features/authentication/widgets/custom_email_field.dart';
import 'package:api/features/authentication/widgets/custom_password_field.dart';
import 'package:api/features/authentication/widgets/real_estate_logo.dart';
import 'package:api/features/authentication/widgets/terms_and_privacy_policy.dart';
import 'package:api/product/utility/paddings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:api/features/authentication/sign_in/cubit/signin_cubit.dart';
import '../widgets/auth_option_text.dart';
import '../widgets/sign_in_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late final TextEditingController _emailcontroller;
  late final TextEditingController _passwordcontroller;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    _emailcontroller = TextEditingController();
    _passwordcontroller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SignInForm(
      emailController: _emailcontroller,
      passwordController: _passwordcontroller,
      formKey: _formKey,
    );
  }
}

class SignInForm extends StatelessWidget {
  const SignInForm({
    Key? key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SignInCubit(),
      child: BlocConsumer<SignInCubit, SignInStates>(
        listener: (BuildContext context, state) {
          if (state is SignInSuccesState) {
        
            state.navigate(context);
          } else if (state is SignInErrorState) {
            showToast(state.errorMessage);
          }
        },
        builder: (BuildContext context, Object? state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: ProjectPaddings.pagepadding,
              child: Stack(
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
                        CustomEmailField(controller: emailController),
                        const SizedBox(height: 20),
                        CustomPasswordField(controller: passwordController),
                        TextButton(
                          child: const Text('Forgot your Password?'),
                          onPressed: () {},
                        ),
                        const SizedBox(height: 20),
                        CustomSignInButton(
                            formKey: formKey,
                            emailController: emailController,
                            passwordController: passwordController),
                        const Spacer(),
                        AuthOptionText(
                          primaryText: 'Don\'t have an account? ',
                          actionText: 'Create One',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterPage()));
                          },
                        ),
                        const TermsAndPolicyText(),
                        SizedBox(height: 12),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
