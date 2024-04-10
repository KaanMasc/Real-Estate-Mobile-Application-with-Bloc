library on_boarding_view;

import 'package:api/features/onboarding/widgets/login_email_button.dart';
import 'package:api/features/onboarding/widgets/login_social_button.dart';
import 'package:api/product/utility/app_sizes.dart';
import 'package:api/product/utility/paddings.dart';
import 'package:flutter/material.dart';
part 'on_boarding_view_backgorund.dart';
part 'on_boarding_view_display_text.dart';
part 'on_boarding_view_footer.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const _OnboardingBackgorund(),
          SizedBox(
            height: AppSizes.screenHeight,
            width: AppSizes.screenWidth,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: kToolbarHeight * 2),
                _OnBoardingViewDisplayText(),
                Spacer(),
                _OnboardingFooter(),
                SizedBox(height: kToolbarHeight),
              ],
            ),
          )
        ],
      ),
    );
  }
}
