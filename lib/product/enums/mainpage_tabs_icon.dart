import 'package:flutter/material.dart';

enum TabbarIconsName {
 homepage,
 favorite,
 messages,
 profile,
 postad,
}

extension TabbarIcon on TabbarIconsName {
  IconData get iconData {
    switch (this) {
      case TabbarIconsName.homepage:
        return Icons.home;
      case TabbarIconsName.favorite:
        return Icons.favorite;
      case TabbarIconsName.messages:
        return Icons.message;
      case TabbarIconsName.profile:
        return Icons.person;
      case TabbarIconsName.postad:
        return Icons.add_box;
      default:
        return Icons.error; 
    }
  }
}