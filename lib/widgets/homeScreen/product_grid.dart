import 'package:flutter/material.dart';
import 'package:screening/Models/product_model.dart';
import 'package:screening/widgets/homeScreen/product_card.dart';

class ProductGridView extends StatelessWidget {
  final List<Product> adminlist;

  const ProductGridView({Key? key, required this.adminlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
        childAspectRatio: 0.75,
      ),
      itemCount: adminlist.length,
      itemBuilder: (context, index) {
        final product = adminlist[index];
        final img = product.image;
        final imageData = img;
        return ProductCard(
          imageUrl: imageData,
          name: product.name,
          price: product.price,
          description: product.description,
          id: product.id,
        );
      },
    );
  }
}
