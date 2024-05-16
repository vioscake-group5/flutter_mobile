import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Color(0xFFEFD7AE),
        automaticallyImplyLeading: false,
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
