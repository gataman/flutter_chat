import 'package:flutter/cupertino.dart';
import 'package:flutter_lovers/common/others/tab_item.dart';

class CustomBottomNavigation extends StatelessWidget {
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectedTab;
  final Map<TabItem, Widget> allPages;
  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys;

  const CustomBottomNavigation({
    Key? key,
    required this.currentTab,
    required this.onSelectedTab,
    required this.allPages,
    required this.navigatorKeys,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            getBottomNavigationBarItem(TabItem.allUsers),
            getBottomNavigationBarItem(TabItem.profile)
          ],
          onTap: (index) => onSelectedTab(TabItem.values[index]),
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            navigatorKey: navigatorKeys[TabItem.values[index]],
            builder: (context) => allPages[TabItem.values[index]]!,
          );
        });
  }

  BottomNavigationBarItem getBottomNavigationBarItem(TabItem tabItem) {
    final currentTab = TabItemData.allTabs[tabItem];
    return BottomNavigationBarItem(
        icon: Icon(currentTab!.icon), label: currentTab.title);
  }
}
