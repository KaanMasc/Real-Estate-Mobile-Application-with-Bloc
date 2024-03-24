import 'package:api/features/home_page.dart/widgets/general/filtered_ad_menu_section.dart';
import 'package:api/features/home_page.dart/widgets/general/preview_card_deck.dart';
import 'package:api/features/home_page.dart/widgets/atomic/animated_search_bar.dart';
import 'package:api/product/utility/paddings.dart';
import 'package:flutter/material.dart';

import 'widgets/general/custom_page_indicator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const _Backgorundimagewithfilter(),
        Padding(
          padding: ProjectPaddings.pagepadding,
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const AnimatedSearchBar(),
                const SizedBox(height: 30),
                FilteredMenuSection(),
                const SizedBox(height: 30),
                const PreviewCardDeck()
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

class _Backgorundimagewithfilter extends StatelessWidget {
  const _Backgorundimagewithfilter();

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter:
          ColorFilter.mode(Colors.white.withOpacity(0.3), BlendMode.srcOver),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/ic_background.jpg',
                ),
                fit: BoxFit.cover)),
      ),
    );
  }
}
