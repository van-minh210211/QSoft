import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingcart/Bloc/CartCubit.dart';
import 'package:shoppingcart/Bloc/CartState.dart';
import 'package:shoppingcart/ListProducts.dart';
import 'package:shoppingcart/Products.dart';
import 'package:shoppingcart/ProductsCard.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({super.key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Cart${state.cartItems.length}"),
          ),
          body: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              return Column(
                children: [
                  Expanded(
                    flex: 7,
                    child: ListView.builder(
                      itemCount: state.cartItems.length,
                      itemBuilder: (context, index) {
                        final product = state.cartItems[index];
                        return ProductCards(
                          imageUrl: product.image,
                          productName: product.title,
                          price: product.price,
                        );
                      },
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total price"),
                            Text('Tổng giá trị: ${state.totalPrice} VND'),
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              padding: EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: Text(
                              'Order',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }
}
