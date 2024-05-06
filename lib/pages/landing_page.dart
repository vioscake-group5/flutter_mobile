import 'package:flutter/material.dart';
import './dashboard_page.dart';
import './menu_page.dart';
import './keranjang_page.dart';
import './setting_page.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => new _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;
  List<Widget> _container = [
    new DashboardPage(),
    new MenuPage(),
    new KeranjangPage(),
    new SettingPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFD7AE),
      body: _container[_selectedIndex],
      bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            activeIcon: new Icon(
              Icon.home,
              color: Colors.amber,
            ),
            icon: new Icon(
              Icon.home,
              color: Colors.grey,
            ),
            title: new Text('Beranda',
                style: TextStyle(
                    color: _selectedIndex == 0 ? Colors.amber : Colors.grey)),
          ),
        ],
      ),
    );
  }
}
