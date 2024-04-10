import 'package:api/features/aPostAdPAge/bloc/post_ad_bloc.dart';
import 'package:api/product/utility/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListingIndicator extends StatelessWidget {
  const ListingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.screenHeight / 18,
      width: AppSizes.screenWidth * 4 / 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildIndicator(context, 1),
          _buildIndicator(context, 2),
          _buildIndicator(context, 3),
          _buildIndicator(context, 4),
        ],
      ),
    );
  }

  Widget _buildIndicator(BuildContext context, int pageNumber) {
    final postzieBloc = BlocProvider.of<PostAdBloc>(context);
    final currentState = postzieBloc.state;

    Color color;
    if (currentState is PostzieLoading) {
      color = Colors.grey;
    } else if (currentState is StepOne && pageNumber == 1) {
      color = Colors.green;
    } else if (currentState is StepTwo && pageNumber <= 2) {
      color = Colors.green;
    } else if (currentState is StepThree && pageNumber <= 3) {
      color = Colors.green;
    } else if (currentState is StepFour && pageNumber <= 4) {
      color = Colors.green;
    } else {
      color = Colors.grey;
    }

    return Container(
      width: AppSizes.screenWidth * 4 / 21,
      height: AppSizes.screenHeight / 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color,
      ),
    );
  }
}
