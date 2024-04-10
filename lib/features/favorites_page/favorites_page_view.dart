import 'package:api/features/favorites_page/widgets/favorites_text.dart';
import 'package:api/product/utility/app_sizes.dart';
import 'package:api/product/utility/paddings.dart';
import 'package:api/product/widgets/project_appbar.dart';
import 'package:flutter/material.dart';
import './favorites_page_view_model.dart';

class FavoritesPageView extends FavoritesPageViewModel {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ProjectAppBar(),
      body: Padding(
        padding: ProjectPaddings.pagepadding,
        child: Column(children: [
          SizedBox(height: 10),
          FavoritesText(),
        ]),
      ),
    );
  }
}
