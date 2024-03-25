import 'package:api/features/post_ad_page/widgets/atomic/post_ad_button.dart';
import 'package:api/features/post_ad_page/widgets/atomic/post_question_box.dart';
import 'package:flutter/material.dart';

class StepOneForm extends StatelessWidget {
  const StepOneForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        PostQuestionBox(
            text: "Please select the type of ad you want to publish."),
        SizedBox(height: 25),
        PostAdButton(
          text: 'I want to sell  my property.(categoryID : 1)',
          categoryId: "1",
        ),
        PostAdButton(
            text: 'I want to rent out my property.(categoryID : 2)',
            categoryId: "2"),
        PostAdButton(
            text: 'I want to rent out my room.(categoryID : 3)',
            categoryId: "3"),
        PostAdButton(
            text: 'I am looking for room.(categoryID : 5)', categoryId: "5"),
      ],
    );
  }
}
