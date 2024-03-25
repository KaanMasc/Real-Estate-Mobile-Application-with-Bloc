import 'package:api/features/authentication/register/cubit/register_cubit.dart';
import 'package:api/features/authentication/register/register_page.dart';
import 'package:api/features/authentication/sign_in/cubit/signin_cubit.dart';
import 'package:api/features/main_page/main_page.dart';
import 'package:api/features/post_ad_page/bloc/ad_bloc.dart';
import 'package:api/features/post_ad_page/post_steps/step_five_form.dart';

import 'package:api/product/initialize/application_start.dart';
import 'package:api/product/utility/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await ApplicationStart.init();
  const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<RegisterCubit>(
            create: (BuildContext context) => RegisterCubit(),
          ),
          BlocProvider<SignInCubit>(
            create: (BuildContext context) => SignInCubit(),
          ),
          BlocProvider<AdBloc>(create: (BuildContext context) => AdBloc()),
        ],
        child: RegisterPage(),
      ),
      theme: ThemeData.light(
        useMaterial3: true,
      ).copyWith(
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          outlinedButtonTheme: const OutlinedButtonThemeData()),
    );
  }
}
