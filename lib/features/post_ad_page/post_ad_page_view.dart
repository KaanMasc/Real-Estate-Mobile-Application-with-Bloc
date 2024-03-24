import 'package:api/features/post_ad_page/post_ad_page_view_model.dart';
import 'package:flutter/material.dart';

import 'package:api/features/post_ad_page/widgets/atomic/ad_step_indicator.dart';

class PostAdPageView extends PostAdPageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('lets share your ad'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AdStepIndicator(currentStep: 0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Back button logic
                },
                child: const Text('Backk'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Next button logic
                },
                child: const Text('Next'),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
