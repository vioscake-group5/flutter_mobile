class Product {
  final String imageUrl;
  final String name;
  final String description;
  final double price;

  Product({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
  });
}

final List<Product> products = [
  Product(
    imageUrl: 'assets/logo.png',
    name: 'Product 1',
    description: 'This is the description for product 1.',
    price: 10.0,
  ),
  Product(
    imageUrl: 'assets/logo.png',
    name: 'Product 2',
    description: 'This is the description for product 2.',
    price: 20.0,
  ),
  // Tambahkan produk lainnya di sini
];
