import 'package:flutter/material.dart';
// <<<<<<< HEAD
import 'package:vioscake_admin/pages/dashboard_page.dart';
import 'package:vioscake_admin/pages/landing_page.dart';
import 'package:vioscake_admin/pages/login_page.dart';
import 'package:vioscake_admin/pages/setting_page.dart';
import 'package:vioscake_admin/pages/welcome_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';
// =======

import 'package:flutter/services.dart';
import 'core/app_export.dart';

// var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
// >>>>>>> 63f4b95f1444c676903750bdea45daedcaffd9a7

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  ThemeHelper().changeTheme('primary');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
// <<<<<<< HEAD
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
// =======
//     // return MaterialApp(
//     //   debugShowCheckedModeBanner: false,
//     //   home: WelcomePage(),
//     // );
//     return Sizer(
//       builder: (context, orientation, deviceType) {
//         return MaterialApp(
//           theme: theme,
//           title: 'Vioscake',
//           debugShowCheckedModeBanner: false,
//           initialRoute: AppRoutes.initialRoute,
//           routes: AppRoutes.routes,
//         );
//       },
// >>>>>>> 63f4b95f1444c676903750bdea45daedcaffd9a7
    );
  }
}
