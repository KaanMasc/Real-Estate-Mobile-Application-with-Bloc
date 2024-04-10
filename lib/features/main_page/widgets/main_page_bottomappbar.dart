import 'package:api/features/main_page/widgets/main_page_tabs.dart';
import 'package:api/product/enums/colors.dart';
import 'package:api/product/enums/mainpage_tabs_icon.dart';
import 'package:api/product/utility/strings.dart';
import 'package:flutter/material.dart';

class Mainpagebottomappbar extends StatelessWidget {
  const Mainpagebottomappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 10.0,
      shape: const CircularNotchedRectangle(),
      child: TabBar(
          splashBorderRadius: BorderRadius.zero,
          labelColor: ProjectColors.black.color,
          unselectedLabelColor: ProjectColors.mortarGrey.color,
          indicatorColor: Colors.transparent,
          tabs: [
            MainPageTabs(
              icon: TabbarIconsName.homepage.iconData,
              text: ProjectStrings().homepage,
            ),
            MainPageTabs(
              icon: TabbarIconsName.favorite.iconData,
              text: ProjectStrings().favorites,
            ),
            MainPageTabs(
              icon: TabbarIconsName.messages.iconData,
              text: ProjectStrings().messages,
            ),
            MainPageTabs(
              icon: TabbarIconsName.profile.iconData,
              text: ProjectStrings().profile,
            ),
          ]),
    );
  }
}
