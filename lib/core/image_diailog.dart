import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget imageDialog(text, path, context) {
return Dialog(
  // backgroundColor: Colors.transparent,
  // elevation: 0,
  child: Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
    Center(
          child: SizedBox(
        height: 300,
        width: 300,
        child: Lottie.asset('assets/animations/register_complete.json'),
      )),
  
    ],
  ),
);}