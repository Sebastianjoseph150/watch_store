part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class AddToCart extends CartEvent {
  final Product product;
  AddToCart({required this.product});
}

class IncreaseQuantity extends CartEvent {
  final int index;
  IncreaseQuantity({required this.index});
}

class DecreaseQuantity extends CartEvent {
  final int index;
  DecreaseQuantity({required this.index});
}
