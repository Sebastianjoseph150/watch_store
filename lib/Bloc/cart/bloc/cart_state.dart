part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {
  final List<Product> product;
  CartInitial({required this.product});
  
}

class ProductAddedState extends CartState {
  final List<Product> product;
  ProductAddedState({required this.product});
}

class qunatityChanged extends CartState {
  List<Product> newquantity;

  qunatityChanged({required this.newquantity});
}

class CartErrorState extends CartState {}
