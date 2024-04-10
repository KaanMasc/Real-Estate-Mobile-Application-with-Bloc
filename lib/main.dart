import 'package:api/features/aPostAdPAge/bloc/post_ad_bloc.dart';
import 'package:api/features/authentication/sign_in/sign_in_page.dart';
import 'package:api/features/main_page/main_page.dart';
import 'package:api/features/onboarding/on_boarding_view.dart';
import 'package:api/features/aPostAdPAge/listing_provider.dart';
import 'package:api/features/authentication/register/cubit/register_cubit.dart';
import 'package:api/features/authentication/sign_in/cubit/signin_cubit.dart';
import 'package:api/product/initialize/application_start.dart';
import 'package:api/product/utility/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  await ApplicationStart.init();
  final prefs = await SharedPreferences.getInstance();
  final isFirstTime = prefs.getBool('isFirstTime') ?? true;

  runApp(
    MyApp(
      isFirstTime: isFirstTime,
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isFirstTime});
  final bool isFirstTime;
  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return ChangeNotifierProvider<ListingProvider>(
      create: (_) => ListingProvider(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<RegisterCubit>(
            create: (BuildContext context) => RegisterCubit(),
          ),
          BlocProvider<SignInCubit>(
            create: (BuildContext context) => SignInCubit(),
          ),
          BlocProvider<PostAdBloc>(
            create: (BuildContext context) => PostAdBloc(context.read<ListingProvider>()),
          ),
        ],
        child: MaterialApp(
          home: isFirstTime ? const OnBoardingView() : const SignInPage(),
          theme: ThemeData(useMaterial3: true),
        ),
      ),
    );
  }
}
