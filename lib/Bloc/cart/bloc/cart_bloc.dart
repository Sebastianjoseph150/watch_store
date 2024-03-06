import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:screening/Models/product_model.dart';
import 'package:screening/Repository/cart_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository cartRepository;
  CartBloc(this.cartRepository)
      : super(CartInitial(product: cartRepository.cartItems)) {
    on<CartEvent>((event, emit) {});
    on<AddToCart>(addToCart);
    on<IncreaseQuantity>(increaseQuantity);
    on<DecreaseQuantity>(decreaseQuantity);
  }

  FutureOr<void> addToCart(AddToCart event, Emitter<CartState> emit) async {
    try {
      final List<Product> added_product =
          await cartRepository.add(event.product);
      print(added_product);
    } catch (e) {
      throw e;
    }
  }

  FutureOr<void> increaseQuantity(
      IncreaseQuantity event, Emitter<CartState> emit) {
    cartRepository.increaseQuantity(event.index);
    cartRepository.loadCartItems;
    emit(qunatityChanged(newquantity: cartRepository.cartItems));
  }

  FutureOr<void> decreaseQuantity(
      DecreaseQuantity event, Emitter<CartState> emit) {
    cartRepository.decreaseQuantity(event.index);
    emit(qunatityChanged(newquantity: cartRepository.cartItems));
  }
}
