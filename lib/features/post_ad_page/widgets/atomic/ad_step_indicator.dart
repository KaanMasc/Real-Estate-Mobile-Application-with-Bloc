import 'package:flutter/material.dart';

class AdStepIndicator extends StatelessWidget {
  final int currentStep;

  const AdStepIndicator({super.key, 
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == currentStep ? Colors.green : Colors.grey,
          ),
          margin: const EdgeInsets.all(4),
        );
      }),
    );
  }
}
