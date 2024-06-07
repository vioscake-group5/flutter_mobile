class Product {
  final String name;
  final String description;
  final int price;
  final String image;
  bool isSelected;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    this.isSelected = false,
  });
}

List<Product> products = [
  Product(
    name: 'Red Valvet Cake',
    description: 'Deskripsi Produk 1',
    price: 10000,
    image: 'https://via.placeholder.com/150',
  ),
  Product(
    name: 'Matcha Cake',
    description: 'Deskripsi Produk 2',
    price: 20000,
    image: 'https://via.placeholder.com/150',
  ),
  Product(
    name: 'Black Forest Cake',
    description: 'Deskripsi Produk 3',
    price: 35000,
    image: 'https://via.placeholder.com/150',
  ),
  // Add more products here
];
