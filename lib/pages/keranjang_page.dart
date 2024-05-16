import 'package:flutter/material.dart';

class KeranjangPage extends StatelessWidget {
  const KeranjangPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang'),
        backgroundColor: Color(0xFFEFD7AE),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text(
          'Ini adalah halaman keranjang',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
