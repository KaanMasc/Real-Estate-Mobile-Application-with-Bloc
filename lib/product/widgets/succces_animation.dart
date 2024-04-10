import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccesAnimation extends StatelessWidget {
  const SuccesAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 300,
        width: 300,
        child: Lottie.asset('assets/animations/upload_succes.json'),
      ),
    );
  }
}
