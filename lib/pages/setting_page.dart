import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan'),
        backgroundColor: Color(0xFFEFD7AE),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text(
          'Ini adalah halaman pengaturan',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
