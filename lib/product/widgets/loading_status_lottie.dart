import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingStatus extends StatelessWidget {
  const LoadingStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: SizedBox(
      height: 300,
      width: 300,
      child: Lottie.asset('assets/animations/loading_status.json'),
    ));
  }
}