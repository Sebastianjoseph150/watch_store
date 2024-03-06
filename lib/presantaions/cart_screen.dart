import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screening/Bloc/cart/bloc/cart_bloc.dart';
import 'package:screening/Models/product_model.dart';
import 'package:screening/Repository/cart_repository.dart';

class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartRepository cartRepository = CartRepository();

  @override
  Widget build(BuildContext context) {
    final producstss = cartRepository.loadCartItems();
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartInitial) {
          return _buildWithProducts(producstss);
        } else if (state is ProductAddedState) {
          return _buildWithProducts(producstss);
        } else if (state is CartErrorState) {
          return _buildError('Error');
        } else if (state is qunatityChanged) {
          return _buildWithProducts(producstss);
        } else {
          return _buildLoading();
        }
      },
    );
  }

  // Widget _buildWithProducts(List<Product> products) {
  Widget _buildWithProducts(Future<List<Product>> productsFuture) {
    return FutureBuilder<List<Product>>(
      future: productsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildLoading();
        } else if (snapshot.hasError) {
          return _buildError('Error');
        } else {
          List<Product> products = snapshot.data ?? [];
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductCard(
                      index: index,
                      imageUrl: product.image,
                      productName: product.name,
                      productPrice: product.price.toString(),
                      quantity: product.quantity,
                      onDelete: () {
                        // Add your delete logic here
                      },
                      onQuantityChanged: (newQuantity) {
                        context.read<CartBloc>().add(IncreaseQuantity(
                              index: index,
                            ));
                      },
                    );
                  },
                ),
              ),
              _buildTotalPriceAndContinueButton(products),
            ],
          );
        }
      },
    );
  }

  Widget _buildTotalPriceAndContinueButton(List<Product> products) {
    double totalPrice = products.fold(
      0,
      (previousValue, element) =>
          previousValue + double.parse(element.price) * element.quantity,
    );

    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Total Price: \$${totalPrice.toStringAsFixed(2)}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              cartRepository.clear();
            },
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }

  Widget _buildError(String message) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class ProductCard extends StatefulWidget {
  final String? imageUrl;
  final String productName;
  final String productPrice;
  final int quantity;
  final int index;
  final Function()? onDelete;
  final Function(int)? onQuantityChanged;

  const ProductCard({
    Key? key,
    required this.imageUrl,
    required this.productName,
    required this.productPrice,
    required this.quantity,
    required this.onDelete,
    required this.onQuantityChanged,
    required this.index,
  }) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: 90,
                      height: 90,
                      child: widget.imageUrl != null
                          ? Image.asset(
                              widget.imageUrl!,
                              fit: BoxFit.cover,
                            )
                          : Container(),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '₹${widget.productPrice}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                        const Text(
                          'In stock',
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _quantity++;
                          });
                          if (widget.onQuantityChanged != null) {
                            widget.onQuantityChanged!(_quantity);
                          }
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        '$_quantity',
                        style: const TextStyle(fontSize: 18),
                      ),
                      IconButton(
                        onPressed: () {
                          if (_quantity > 0) {
                            setState(() {
                              _quantity--;
                            });
                            if (widget.onQuantityChanged != null) {
                              widget.onQuantityChanged!(_quantity);
                            }
                          }
                        },
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
