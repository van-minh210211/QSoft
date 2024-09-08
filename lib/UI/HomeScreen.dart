import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingcart/Bloc/CartCubit.dart';
import 'package:shoppingcart/Bloc/CartState.dart';
import 'package:shoppingcart/ListProducts.dart';
import 'package:shoppingcart/AllProducts.dart';
import 'package:shoppingcart/UI/CartScreen.dart';
import 'package:shoppingcart/model/products_model.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text("Home", style: TextStyle(color: Colors.white)),
          centerTitle: true,
          actions: <Widget>[
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                return Stack(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Cartscreen()),
                        );
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    ),
                    if (state.totalItemsInCart > 0)
                      Positioned(
                        right: 8,
                        top: 8,
                        child: Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '${state.totalItemsInCart}',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("HOT products"),
              Listproducts(),
              Text("All Products"),
              Allproducts(),
            ],
          ),
        ),
      ),
    );
  }
}
