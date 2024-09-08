import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppingcart/UI/HomeScreen.dart';
import 'package:shoppingcart/diglogaddtocart.dart';

class ProductCard extends StatefulWidget {
  final String imageUrl;
  final String productName;
  final int price;

  ProductCard({
    required this.imageUrl,
    required this.productName,
    required this.price,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: 150,
            height: 220,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.red, // Màu của viền
                width: 3.0, // Độ dày của viền
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(widget.imageUrl),
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Icon(
                        Icons.whatshot, // Biểu tượng lửa
                        color: Colors.orange,
                        size: 24,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.productName),
                          Text(widget.price.toString() + " VND"),
                        ],
                      ),
                      InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return AddToCartDialog(
                                      imageUrl: widget.imageUrl,
                                      productName: widget.productName,
                                      price: widget.price);
                                });
                          },
                          child: Icon(Icons.add_shopping_cart))
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
