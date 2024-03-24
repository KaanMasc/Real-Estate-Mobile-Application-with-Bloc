import 'package:api/features/post_ad_page/widgets/atomic/post_question_box.dart';
import 'package:flutter/material.dart';

class StepFourForm extends StatelessWidget {
  const StepFourForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PostQuestionBox(text: 'Locatio')
        ],
      ),
    );
  }
}