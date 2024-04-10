import 'package:api/features/aPostAdPAge/bloc/post_ad_bloc.dart';
import 'package:api/product/mixins/mixin_state_handler.dart';
import 'package:api/features/aPostAdPAge/steps/ad_step_four.dart';
import 'package:api/features/aPostAdPAge/steps/ad_step_one.dart';
import 'package:api/features/aPostAdPAge/steps/ad_step_three.dart';
import 'package:api/features/aPostAdPAge/steps/ad_step_two.dart';
import 'package:api/features/aPostAdPAge/widget/widgets/buton_footer.dart';
import 'package:api/features/aPostAdPAge/widget/widgets/listing_indicator.dart';
import 'package:api/product/utility/paddings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostAdPage extends StatelessWidget with StateHandler {
  const PostAdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostAdBloc, PostAdStates>(
      listener: (context, state) {
        if (state is PostzieSucces) {
          handleSuccessState(context);
        } else if (state is PostzieError) {
          handleErrorState();
        } else if (state is PostzieLoading) {
          return handleLoadingState(context);
        }
      },
      builder: (context, state) {
        Widget content;
        switch (state.runtimeType) {
          case StepOne:
            content = AdStepOne();
            break;
          case StepTwo:
            content = const AdStepTwo();
            break;
          case StepThree:
            content = const AdStepThree();
            break;
          case StepFour:
            content = AdStepFour();
            break;
          default:
            content = const SizedBox();
        }
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: ProjectPaddings.pagepadding,
              child: Column(
                children: [
                  const ListingIndicator(),
                  Expanded(child: content),
                  const PostAdButons(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
