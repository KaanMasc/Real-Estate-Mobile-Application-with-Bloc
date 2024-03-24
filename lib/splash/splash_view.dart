import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          height: 400,
          width: 400,
          child: Column(
            children: [
              Text('Welcome to our App ',
                  style: 
                 TextStyle(fontSize: 35)),
               CircularProgressIndicator.adaptive(),
            ],
          ),
        ),
      ),
    );
  }
}
