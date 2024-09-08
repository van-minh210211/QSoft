import 'package:flutter/material.dart';
import 'package:shoppingcart/Products.dart';

class Allproducts extends StatefulWidget {
  const Allproducts({super.key});

  @override
  State<Allproducts> createState() => _AllproductsState();
}

class _AllproductsState extends State<Allproducts> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.builder(
        itemCount: 30,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisExtent: 280, crossAxisSpacing: 30),
        itemBuilder: (context, index) {
          return ProductCard(
              imageUrl: "assets/image/product_6.jpg",
              price: 1300000,
              productName: "Products #16");
        },
      ),
    );
  }
}
