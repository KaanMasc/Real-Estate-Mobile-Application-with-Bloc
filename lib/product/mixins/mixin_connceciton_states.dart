import 'package:api/product/widgets/loading_animation.dart';
import 'package:flutter/material.dart';

mixin ConnectionStates {
  Center connectionLoading() {
    return const Center(child: LoadingAnimation());
  }

  Center connectionError() {
    return const Center(child: Text('An Error Accured Please Try Again Later'));
  }
}
