import 'package:equatable/equatable.dart';
import 'package:shoppingcart/model/products_model.dart';

class CartState extends Equatable {
  final List<Product> cartItems;
  final double totalPrice;

  CartState({
    this.cartItems = const [],
    this.totalPrice = 0.0,
  });

  int get totalItemsInCart => cartItems.length;
  @override
  List<Object> get props => [cartItems, totalPrice, totalItemsInCart];
}
