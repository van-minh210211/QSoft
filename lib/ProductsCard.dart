import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingcart/Bloc/CartCubit.dart';
import 'package:shoppingcart/UI/HomeScreen.dart';
import 'package:shoppingcart/diglogaddtocart.dart';
import 'package:shoppingcart/model/products_model.dart';

class ProductCards extends StatefulWidget {
  final String imageUrl;
  final String productName;
  final int price;

  ProductCards({
    required this.imageUrl,
    required this.productName,
    required this.price,
  });

  @override
  State<ProductCards> createState() => _ProductCardsState();
}

class _ProductCardsState extends State<ProductCards> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 112,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  // Độ dày của viền
                  ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 110,
                  child: Row(
                    children: [
                      Image.asset(
                        widget.imageUrl,
                        height: 110,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 16),
                      Container(
                        width: 260,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.productName,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  widget.price.toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (quantity > 1) quantity--;
                                        });
                                      },
                                      icon: Icon(Icons.remove),
                                    ),
                                    Text(
                                      quantity.toString(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          quantity++;
                                        });
                                      },
                                      icon: Icon(Icons.add),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.close),
                                ),
                                Text(widget.productName)
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
