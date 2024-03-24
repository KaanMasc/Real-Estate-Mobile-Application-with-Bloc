import 'package:api/features/favorites_page/favorites_page.dart';
import 'package:api/features/home_page.dart/homepage.dart';
import 'package:api/features/main_page/widgets/main_page_bottomappbar.dart';
import 'package:api/features/messages_page/messages_page.dart';
import 'package:api/features/post_ad_page/post_ad_page.dart';
import 'package:api/features/profile_page/profile_page.dart';
import 'package:api/product/enums/colors.dart';
import 'package:flutter/material.dart';
import '../../product/enums/mainpage_tabs_icon.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(children: [
          HomePage(),
          FavoritesPage(),
          MessagesPage(),
          ProfilePage()
        ]),
        floatingActionButton: _MainPageFAB(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Mainpagebottomappbar(),
      ),
    );
  }
}

class _MainPageFAB extends StatelessWidget {
  const _MainPageFAB();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PostAdPage()));
        },
        backgroundColor: Colors.white,
        child: Icon(
          TabbarIconsName.postad.iconData,
          color: ProjectColors.mortarGrey.color,
        ));
  }
}
