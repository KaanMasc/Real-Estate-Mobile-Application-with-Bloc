import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../product/enums/colors.dart';
import '../../../product/utility/app_sizes.dart';

class BackgroundFiltered extends StatelessWidget {
  const BackgroundFiltered({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: const AlignmentDirectional(-8, -10),
          child: Container(
            height: AppSizes.screenHeight / 1.1,
            width: AppSizes.screenWidth / 1.1,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: ProjectColors.orange.color),
          ),
        ),
        Align(
          child: Container(
            height: AppSizes.screenHeight,
            width: AppSizes.screenWidth,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: ProjectColors.pagecolor.color),
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 60, sigmaY: 80),
          child: Container(),
        )
      ],
    );
  }
}
