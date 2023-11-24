import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:project_4/screens/HomePage/homepage_screen_drawer.dart';
import 'package:project_4/screens/SearchPage/search_screen.dart';
import 'package:project_4/screens/order/order_screen.dart';
import 'package:project_4/screens/profile/profile_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with TickerProviderStateMixin {
  List<Widget> screens = [
    const HomePageScreenDrawer(),
    const SearchScreen(),
    const OrderScreen(isBottomNavBar: true),
    const ProfileScreen(),
  ];
  var _selectedTab = _SelectedTab.home;
  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    //var anim =
    AnimationController(
      vsync: this,
      value: 1,
      duration: const Duration(milliseconds: 500),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: screens[_selectedTab.index],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Visibility(
          visible: _selectedTab != _SelectedTab.order,
          child: DotNavigationBar(
            backgroundColor: const Color(0xfffccf78),
            margin: const EdgeInsets.only(left: 10, right: 10),
            currentIndex: _SelectedTab.values.indexOf(_selectedTab),
            borderRadius: 20,
            dotIndicatorColor: const Color(0xff24283b),
            unselectedItemColor: Colors.black,
            splashBorderRadius: 50,
            selectedItemColor: const Color(0xFF292E41),
            enablePaddingAnimation: true,
            onTap: _handleIndexChanged,
            items: [
              navigationBarIcons(Icons.home_outlined),
              navigationBarIcons(Icons.search),
              navigationBarIcons(Icons.shopping_bag_outlined),
              navigationBarIcons(Icons.person_outline),
            ],
          ),
        ),
      ),
    );
  }

  DotNavigationBarItem navigationBarIcons(IconData iconData) {
    return DotNavigationBarItem(
      icon: Icon(
        iconData,
      ),
      selectedColor: const Color(0xff24283b),
    );
  }
}

enum _SelectedTab { home, search, order, person }
