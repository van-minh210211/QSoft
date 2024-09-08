import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingcart/Bloc/CartCubit.dart';
import 'package:shoppingcart/UI/HomeScreen.dart';
import 'package:shoppingcart/model/products_model.dart';

class AddToCartDialog extends StatefulWidget {
  final String imageUrl;
  final String productName;
  final int price;

  AddToCartDialog(
      {required this.imageUrl, required this.productName, required this.price});

  @override
  _AddToCartDialogState createState() => _AddToCartDialogState();
}

class _AddToCartDialogState extends State<AddToCartDialog> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        color: Colors.white,
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
                                    fontSize: 20, fontWeight: FontWeight.bold),
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
                      SizedBox(
                        width: 12,
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
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                final prducts = Product(
                  image: widget.imageUrl,
                  title: widget.productName,
                  price: widget.price,
                );
                context.read<CartCubit>().addToCart(prducts);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Homescreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(
                'Add to cart',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
