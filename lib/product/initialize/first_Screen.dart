/* import 'package:api/features/onboarding/on_boarding_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return FutureBuilder<bool>(
      future: authService.isFirstTime(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else {
          if (snapshot.data == true) {
            // İlk giriş
            return OnBoardingView();
          } else {
            // İlk giriş değil
            return StreamBuilder<User?>(
              stream: authService.user,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  final User? user = snapshot.data;
                  return user == null ? LoginScreen() : HomeScreen();
                } else {
                  return Scaffold(body: Center(child: CircularProgressIndicator()));
                }
              },
            );
          }
        }
      },
    );
  }
}
 */