import 'package:flutter/material.dart';
import 'package:vioscake_admin/models/card_product.dart';
import 'package:vioscake_admin/models/product.dart';
import 'package:vioscake_admin/pages/konfirmasi_pesanan_page.dart';
import 'package:intl/intl.dart';

class MenuPage extends StatelessWidget {
  final Function(Product) onAddToCart;

  const MenuPage({Key? key, required this.onAddToCart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Menu',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.chat_bubble_outline, color: Colors.black),
            onPressed: () {
              // Aksi ketika tombol keranjang ditekan
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search Your Base Cake',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: products[index],
                    onAddToCart: () {
                      onAddToCart(products[index]);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => KonfirmasiPesananPage(
                            selectedProduct: products[index],
                            onAddToCart: onAddToCart,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
