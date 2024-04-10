import 'package:api/features/aPostAdPAge/bloc/post_ad_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../product/utility/app_sizes.dart';

class PostAdButons extends StatelessWidget {
  const PostAdButons({super.key});

  @override
  Widget build(BuildContext context) {
    final _postAdBloc = BlocProvider.of<PostAdBloc>(context);

    return SizedBox(
      height: kToolbarHeight,
      width: AppSizes.screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          OutlinedButton(
            onPressed: () {
              _postAdBloc.add(const PreviousPageEvent());
            },
            child: const Text("BACK"),
          ),
          BlocBuilder<PostAdBloc, PostAdStates>(
            builder: (context, state) {
              return OutlinedButton(
                onPressed: () {
                  if (state is StepFour) {
                    _postAdBloc.add(const PublishDataEvent());
                  } else {
                    _postAdBloc.add(const NextPageEvent());
                  }
                },
                child: Text(state is StepFour ? 'PUBLISH' : 'NEXT'),
              );
            },
          ),
        ],
      ),
    );
  }
}
