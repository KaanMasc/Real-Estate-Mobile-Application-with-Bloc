import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../product/enums/colors.dart';
import '../../../product/utility/app_sizes.dart';

class BackgroundFiltered extends StatelessWidget {
  const BackgroundFiltered({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.screenHeight,
      width: AppSizes.screenWidth,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/ic_auth_backgorund.JPEG'), fit: BoxFit.fitHeight)),
    );
  }
}
