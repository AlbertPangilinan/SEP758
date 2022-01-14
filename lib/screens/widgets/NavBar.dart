import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/screenNavigation.dart';
import '../../classes/ScreenArguments.dart';

class NavBar extends StatefulWidget {
  const NavBar({
    Key? key,
    required this.title,
    required this.args,
  }) : super(key: key);

  final String title;
  final ScreenArguments args;

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    List<String> _navRoutes = [];
    List<BottomNavigationBarItem> _items = [];

    for (Map page in screenNavigation) {
      _navRoutes.add(page['route']);
      _items.add(
        BottomNavigationBarItem(
          icon: page['icon'],
          label: page['label'],
        ),
      );
    }

    int _selectedRoute =
        _navRoutes.indexOf(ModalRoute.of(context)!.settings.name ?? '/home');

    if (_selectedRoute < 0) {
      _selectedRoute = 2;
    }

    navBarHander(int index) {
      if (index != _selectedRoute) {
        Navigator.pushNamed(
          context,
          screenNavigation[index]['route'],
          arguments: widget.args,
        );
      }
    }

    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: darkgrey,
        selectedItemColor: white,
        selectedFontSize: 12.0,
        unselectedItemColor: lightgrey,
        currentIndex: _selectedRoute,
        onTap: navBarHander,
        items: _items);
  }
}
