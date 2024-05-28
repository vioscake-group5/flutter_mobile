import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:vioscake_admin/models/product.dart';

class KonfirmasiPesananPage extends StatefulWidget {
  final Product selectedProduct;

  const KonfirmasiPesananPage({Key? key, required this.selectedProduct})
      : super(key: key);

  @override
  _KonfirmasiPesananPageState createState() => _KonfirmasiPesananPageState();
}

class _KonfirmasiPesananPageState extends State<KonfirmasiPesananPage> {
  String selectedSize = '10 x 10 x 10';
  List<String> sizes = ['10 x 10 x 10', '15 x 15 x 15', '20 x 20 x 20'];
  List<String> toppings = ['Missies', 'Oreo', 'Nutella'];
  List<bool> selectedToppings = [false, false, false];
  TextEditingController requestController = TextEditingController();
  File? imageFile;
  double estimatedPrice = 45000.0;
  String deliveryAddress = 'Jl. Samanhudi / III No. 51';

  @override
  void initState() {
    super.initState();
    _loadAddress();
  }

  Future<void> _loadAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      deliveryAddress =
          prefs.getString('deliveryAddress') ?? 'Jl. Samanhudi / III No. 51';
    });
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  void _addToCart() {
    // Add to cart logic here
    Navigator.pushReplacementNamed(context, '/keranjang');
  }

  void _placeOrder() {
    // Place order logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selesaikan Pesanan'),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFFEFD7AE),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Delivery to your address',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(height: 4),
                        Text(deliveryAddress),
                      ],
                    ),
                    Text(
                      '2,4 km',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                widget.selectedProduct.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text('Desain kue yang bisa digunakan:'),
              SizedBox(height: 8),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.grey[300],
                    child: Center(child: Text('Desain ${index + 1}')),
                  );
                },
              ),
              SizedBox(height: 16),
              Text('Pilih Ukuran'),
              SizedBox(height: 8),
              DropdownButton<String>(
                value: selectedSize,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedSize = newValue!;
                  });
                },
                items: sizes.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
              Text('Topping'),
              Column(
                children: List.generate(toppings.length, (index) {
                  return CheckboxListTile(
                    title: Text(toppings[index]),
                    value: selectedToppings[index],
                    onChanged: (bool? value) {
                      setState(() {
                        selectedToppings[index] = value!;
                      });
                    },
                  );
                }),
              ),
              SizedBox(height: 16),
              Text('Request (*jika diisi akan menambah total harga)'),
              SizedBox(height: 8),
              TextField(
                controller: requestController,
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Menulis...',
                ),
              ),
              SizedBox(height: 16),
              Text('Gambar untuk penjelasan request'),
              SizedBox(height: 8),
              Row(
                children: [
                  InkWell(
                    onTap: _pickImage,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.grey[300],
                      child: imageFile == null
                          ? Icon(Icons.add_a_photo)
                          : Image.file(imageFile!, fit: BoxFit.cover),
                    ),
                  ),
                  // Add more image slots if necessary
                ],
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Estimasi Harga', style: TextStyle(fontSize: 16)),
                    Text('Rp${estimatedPrice.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: _addToCart,
                    child: Text('Keranjang'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _placeOrder,
                    child: Text('Bayar'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
