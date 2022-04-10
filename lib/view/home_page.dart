import 'package:flutter/material.dart';
import 'package:flutter_lovers/common/others/cutom_bottom_navigation.dart';
import 'package:flutter_lovers/common/others/tab_item.dart';
import 'package:flutter_lovers/model/user/user_model.dart';
import 'package:flutter_lovers/view/app/profile_page.dart';
import 'package:flutter_lovers/view/app/users_page.dart';

class HomePage extends StatefulWidget {
  UserModel user;

  HomePage(this.user, {Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabItem _currentTabItem = TabItem.allUsers;

  final Map<TabItem, GlobalKey<NavigatorState>> _navigatorKeys = {
    TabItem.allUsers: GlobalKey<NavigatorState>(),
    TabItem.profile: GlobalKey<NavigatorState>(),
  };

  Map<TabItem, Widget> _allPages() {
    return {
      TabItem.allUsers: const UsersPage(),
      TabItem.profile: const ProfilePage(),
    };
  }

  @override
  Widget build(BuildContext context) {
    //final _userViewModel = Provider.of<UserViewModel>(context);
    return WillPopScope(
      onWillPop: () async =>
          !await _navigatorKeys[_currentTabItem]!.currentState!.maybePop(),
      child: CustomBottomNavigation(
        currentTab: _currentTabItem,
        onSelectedTab: (selectedTab) {
          setState(() {
            _currentTabItem = selectedTab;
          });
        },
        allPages: _allPages(),
        navigatorKeys: _navigatorKeys,
      ),
    );
  }
}
