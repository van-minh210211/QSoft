class Product {
  final String title;
  final int price;
  final String image;

  Product({
    required this.title,
    required this.price,
    required this.image,
    // Mặc định là 1
  });

  Product copyWith({int? quantity}) {
    return Product(
      title: this.title,
      price: this.price,
      image: this.image,
    );
  }
}
