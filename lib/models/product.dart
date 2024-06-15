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
    name: 'Red Velvet Cake',
    description: 'Base cake dengan rasa red velvet',
    price: 45000,
    image: 'assets/base_cake/red_valvet.png',
  ),
  Product(
    name: 'Matcha Cake',
    description: 'Base cake dengan rasa matcha asli',
    price: 45000,
    image: 'assets/base_cake/matcha.png',
  ),
  Product(
    name: 'Chocolate Cake',
    description: 'Base cake dengan coklat yang melimpah',
    price: 45000,
    image: 'assets/base_cake/chocolate.png',
  ),
  Product(
    name: 'Cheese Cake',
    description: 'Base cake yang lembut dengan cita rasa keju',
    price: 45000,
    image: 'assets/base_cake/cheese.png',
  ),
  Product(
    name: 'Black Forest Cake',
    description: 'Base cake dengan coklat dan cherry',
    price: 45000,
    image: 'assets/base_cake/black_forest.png',
  ),
  Product(
    name: 'Pandan Cake',
    description: 'Base cake dengan aroma pandan',
    price: 45000,
    image: 'assets/base_cake/pandan.png',
  ),
  Product(
    name: 'Brownies',
    description: 'Base cake brownies',
    price: 45000,
    image: 'assets/base_cake/brownies.png',
  ),
];
