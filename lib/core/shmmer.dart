import 'package:api/product/utility/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Sgimmer extends StatelessWidget {
  const Sgimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.screenWidth,
      height: AppSizes.screenWidth,
      child: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white,
        child: Container(
          width: AppSizes.screenWidth,
          height: AppSizes.screenHeight / 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(30)),
            elevation: 5,
          ),
        ),
      ),
    );
  }
}
