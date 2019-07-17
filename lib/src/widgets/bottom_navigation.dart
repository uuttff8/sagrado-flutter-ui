import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:sagrado_flutter_ui/src/screens/about/about.dart';

import 'package:sagrado_flutter_ui/src/screens/events/events.dart';
import 'package:sagrado_flutter_ui/src/screens/places/places.dart';
import 'package:sagrado_flutter_ui/src/screens/profile/profile.dart';
import 'package:sagrado_flutter_ui/src/screens/sales/sales.dart';

import '../screens/chose_place/chose_place.dart';

// Steps to add/delete new elements:
// 1. add new field in TabItem enum and check linter
// 2. add new element at _buildBottomNavBar
// 3. add new index at _onSelectTab

enum TabItem { Profile, Event, Sales, Places, About }

String _tabItemName(TabItem tabItem) {
  switch (tabItem) {
    case TabItem.Profile:
      return "Profile";
    case TabItem.Event:
      return "Event";
    case TabItem.Sales:
      return "Sales";
    case TabItem.Places:
      return "Places";
    case TabItem.About:
      return "About";
  }

  return null;
}

class CustomBottomNavigation extends StatefulWidget {
  CustomBottomNavigation({Key key}) : super(key: key);

  _CustomBottomNavigationState createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  TabItem selectedItem = TabItem.Profile;

  void _updateCurrentItem(TabItem item) {
    setState(() {
      selectedItem = item;
    });
  }

  void _onSelectTab(int index) {
    switch (index) {
      case 0:
        _updateCurrentItem(TabItem.Profile);
        break;
      case 1:
        _updateCurrentItem(TabItem.Event);
        break;
      case 2:
        _updateCurrentItem(TabItem.Sales);
        break;
      case 3:
        _updateCurrentItem(TabItem.Places);
        break;
      case 4:
        _updateCurrentItem(TabItem.About);
        break;
    }
  }

  Widget _buildBody() {
    switch (selectedItem) {
      case TabItem.Profile:
        return ProfileScreen();
      case TabItem.Event:
        return EventScreen();
      case TabItem.Sales:
        return SalesScreen();
      case TabItem.Places:
        return PlacesScreen();
      case TabItem.About:
        return AboutScreen();
    }

    return Container();
  }

  BottomNavigationBarItem _buildItem(IconData icon, TabItem tabItem) {
    String text = _tabItemName(tabItem);
    return BottomNavigationBarItem(
      icon: Icon(icon),
      title: Text(
        text,
        style: TextStyle(letterSpacing: 1.0),
      ),
    );
  }

  PlatformNavBar _buildBottomNavBar() {
    return PlatformNavBar(
      items: [
        _buildItem(Icons.person, TabItem.Profile),
        _buildItem(Icons.event, TabItem.Event),
        _buildItem(Icons.attach_money, TabItem.Sales),
        _buildItem(Icons.place, TabItem.Places),
        _buildItem(Icons.supervisor_account, TabItem.About)
      ],
      itemChanged: (value) {
        _onSelectTab(value);
      },
      currentIndex: selectedItem.index,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: _buildBody(),
      bottomNavBar: _buildBottomNavBar(),
    );
  }
}
