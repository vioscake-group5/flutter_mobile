import 'package:flutter/material.dart';

class DashboardUser extends StatelessWidget {
  const DashboardUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Color(0xFFEFD7AE),
      ),
      body: Center(
        child: Text(
          'Ini adalah halaman dashboard',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
