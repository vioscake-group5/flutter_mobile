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
      body: Center(
        child: _container.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/icon/home.png")),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/icon/menu.png")),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/icon/keranjang.png")),
            label: 'Keranjang',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/icon/setting.png")),
            label: 'Pengaturan',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFDEAE78),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
