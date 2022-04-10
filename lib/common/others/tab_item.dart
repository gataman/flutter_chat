import 'package:flutter/material.dart';

enum TabItem { allUsers, profile }

class TabItemData {
  final String title;
  final IconData icon;

  TabItemData(this.title, this.icon);

  static Map<TabItem, TabItemData> allTabs = {
    TabItem.allUsers: TabItemData("Kullanıcılar", Icons.supervised_user_circle),
    TabItem.profile: TabItemData("Profile", Icons.person_rounded)
  };
}
