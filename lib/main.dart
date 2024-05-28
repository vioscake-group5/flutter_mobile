import 'package:flutter/material.dart';
import 'package:vioscake_admin/pages/dashboard_page.dart';
import 'package:vioscake_admin/pages/landing_page.dart';
import 'package:vioscake_admin/pages/login_page.dart';
import 'package:vioscake_admin/pages/setting_page.dart';
import 'package:vioscake_admin/pages/welcome_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CheckLogin(),
      routes: {
        '/landing_page': (context) => LandingPage(),
        '/login': (context) => LoginPage(),
        '/welcome': (context) => WelcomePage(),
        '/settings': (context) => SettingPage(),
      },
    );
  }
}

class CheckLogin extends StatefulWidget {
  @override
  _CheckLoginState createState() => _CheckLoginState();
}

class _CheckLoginState extends State<CheckLogin> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      Navigator.pushReplacementNamed(context, '/landing_page');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
