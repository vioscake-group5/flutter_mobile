import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        backgroundColor: Color(0xFFEFD7AE),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text(
          'Ini adalah halaman menu',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
