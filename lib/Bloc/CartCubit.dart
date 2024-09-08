import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingcart/Bloc/CartState.dart';
import 'package:shoppingcart/model/products_model.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState());

  void addToCart(Product product) {
    final updatedCart = List<Product>.from(state.cartItems)..add(product);
    final updatedPrice = state.totalPrice + product.price;
    emit(CartState(cartItems: updatedCart, totalPrice: updatedPrice));
  }

  void removeFromCart(Product product) {
    final updatedCart = List<Product>.from(state.cartItems)
      ..removeWhere((item) => item.price == product.price);
    final updatedPrice = state.totalPrice - product.price;
    emit(CartState(cartItems: updatedCart, totalPrice: updatedPrice));
  }

  // Đếm số lượng sản phẩm trong giỏ hàng
  int get totalItemsInCart {
    return state.cartItems.length;
  }
}
