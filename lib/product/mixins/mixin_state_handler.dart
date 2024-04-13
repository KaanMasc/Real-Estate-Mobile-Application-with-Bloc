import 'package:api/features/main_page/main_page.dart';
import 'package:api/product/utility/app_sizes.dart';
import 'package:api/product/utility/navigate.dart';
import 'package:flutter/material.dart';
import '../../core/toast_message.dart';
import '../widgets/succces_animation.dart';

mixin StateHandler {
  void handleSuccessState(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const SuccesAnimation();
      },
    );
    Future.delayed(const Duration(seconds: 3), () {
      navigateAndFinish(context, const MainPage());
    });
  }

  void handleErrorState() {
    ToastMesage.showToast('Error, Please Try again later.');
  }

  void handleLoadingState(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
            child: SizedBox(
                height: AppSizes.screenHeight / 2,
                width: AppSizes.screenHeight / 2,
                child: const CircularProgressIndicator()));
      },
    );
  }
}
