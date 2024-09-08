import 'package:flutter/material.dart';
import 'package:shoppingcart/Products.dart';
import 'package:shoppingcart/model/products_model.dart';

class Listproducts extends StatefulWidget {
  const Listproducts({super.key});

  @override
  State<Listproducts> createState() => _ListproductsState();
}

class _ListproductsState extends State<Listproducts> {
  final List<Product> products = [
    Product(
      title: "Products 1",
      price: 234,
      image: "assets/image/product_0.jpg",
    ),
    Product(
      title: "Products 2",
      price: 234,
      image: "assets/image/product_1.jpg",
    ),
    Product(
      title: "Products 3",
      price: 234,
      image: "assets/image/product_2.jpg",
    ),
    Product(
      title: "Products 4",
      price: 234,
      image: "assets/image/product_3.jpg",
    ),
    Product(
      title: "Products 5",
      price: 234,
      image: "assets/image/product_4.jpg",
    ),
    Product(
      title: "6",
      price: 234,
      image: "assets/image/product_5.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final Item = products[index];
          return Row(
            children: [
              ProductCard(
                imageUrl: Item.image,
                price: Item.price,
                productName: Item.title,
              ),
            ],
          );
        },
      ),
    );
  }
}
