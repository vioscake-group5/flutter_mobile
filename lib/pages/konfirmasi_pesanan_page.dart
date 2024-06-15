import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:vioscake_admin/models/product.dart';
import 'package:vioscake_admin/shared/shared.dart';

class KonfirmasiPesananPage extends StatefulWidget {
  final Product selectedProduct;
  final Function(Product) onAddToCart;

  const KonfirmasiPesananPage({
    Key? key,
    required this.selectedProduct,
    required this.onAddToCart,
  }) : super(key: key);

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
  int? selectedDesignIndex;
  bool isDesignSelectable = true;
  DateTime? selectedDate;

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
        isDesignSelectable = false; // Disable design selection
        selectedDesignIndex = null; // Reset design selection
      });
    }
  }

  void _removeImage() {
    setState(() {
      imageFile = null;
      isDesignSelectable = true; // Enable design selection
    });
  }

  void _previewImage() {
    if (imageFile != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.file(imageFile!),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            ),
          );
        },
      );
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _addToCart() {
    widget.onAddToCart(widget.selectedProduct);
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
                  return GestureDetector(
                    onTap: isDesignSelectable
                        ? () {
                            setState(() {
                              selectedDesignIndex = index;
                            });
                          }
                        : null,
                    child: Container(
                      decoration: BoxDecoration(
                        border: selectedDesignIndex == index
                            ? Border.all(color: Color(0xFFEFD7AE), width: 1)
                            : null,
                      ),
                      child: Center(
                        child: Text('Desain ${index + 1}'),
                      ),
                    ),
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
              Text('Tanggal Pesanan'),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      selectedDate == null
                          ? 'Pilih Tanggal'
                          : "${selectedDate!.toLocal()}".split(' ')[0],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: Text('Pilih Tanggal'),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text('Request (*jika diisi akan menambah total harga)'),
              SizedBox(height: 8),
              TextField(
                controller: requestController,
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Ketik pesan...',
                ),
              ),
              SizedBox(height: 16),
              Text('Gambar untuk penjelasan request'),
              SizedBox(height: 8),
              Row(
                children: [
                  InkWell(
                    onTap: imageFile == null ? _pickImage : _previewImage,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.grey[300],
                      child: imageFile == null
                          ? Icon(Icons.add_a_photo)
                          : Image.file(imageFile!, fit: BoxFit.cover),
                    ),
                  ),
                  if (imageFile != null)
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: _removeImage,
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
                  OutlinedButton(
                    onPressed: _addToCart,
                    child: Text(
                      '+ Keranjang',
                      style: TextStyle(color: Color(0xFFDEAE78)),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 2, color: Color(0xFFDEAE78)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      minimumSize: Size(170, 40),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _placeOrder,
                    child: Text(
                      'Bayar',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFDEAE78),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      minimumSize: Size(170, 40),
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
