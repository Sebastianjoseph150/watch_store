import 'package:flutter/material.dart';
import 'package:screening/Models/product_model.dart';
import 'package:screening/widgets/homeScreen/product_grid.dart';

class HomeScreen extends StatelessWidget {
  List<Product> hardcodedProducts = [
    Product(
      name: "watch 1",
      price: "20.99",
      image: "Assets/images/images (1).jpeg",
      description:
          "1. Watch, look, see imply being aware of things around one by perceiving them through the eyes\nTo watch is to be a spectator, to look on or observe, or to fix the attention upon during passage of time: to watch while a procession passes. To look is to direct the gaze with the intention of seeing, to use the eyesight with attention: to look for violets in the spring; to look at articles displayed for sale. To see is to perceive with the eyes, to obtain a visual impression, with or without fixing the attention: animals able to see in the dark}",
      id: 1,
      quantity: 1,
    ),
    Product(
      name: "Product 2",
      price: "15.49",
      image: "Assets/images/images (2).jpeg",
      description:
          "1. Watch, look, see imply being aware of things around one by perceiving them through the eyes\nTo watch is to be a spectator, to look on or observe, or to fix the attention upon during passage of time: to watch while a procession passes. To look is to direct the gaze with the intention of seeing, to use the eyesight with attention: to look for violets in the spring; to look at articles displayed for sale. To see is to perceive with the eyes, to obtain a visual impression, with or without fixing the attention: animals able to see in the dark}",
      id: 2,
      quantity: 1,
    ),
    Product(
      name: "Product 3",
      price: "30.00",
      image: "Assets/images/images (3).jpeg",
      description:
          "1. Watch, look, see imply being aware of things around one by perceiving them through the eyes\nTo watch is to be a spectator, to look on or observe, or to fix the attention upon during passage of time: to watch while a procession passes. To look is to direct the gaze with the intention of seeing, to use the eyesight with attention: to look for violets in the spring; to look at articles displayed for sale. To see is to perceive with the eyes, to obtain a visual impression, with or without fixing the attention: animals able to see in the dark}",
      id: 3,
      quantity: 1,
    ),
    // Additional items
    Product(
      name: "Product 4",
      price: "25.99",
      image: "Assets/images/images (4).jpeg",
      description:
          "1. Watch, look, see imply being aware of things around one by perceiving them through the eyes\nTo watch is to be a spectator, to look on or observe, or to fix the attention upon during passage of time: to watch while a procession passes. To look is to direct the gaze with the intention of seeing, to use the eyesight with attention: to look for violets in the spring; to look at articles displayed for sale. To see is to perceive with the eyes, to obtain a visual impression, with or without fixing the attention: animals able to see in the dark}",
      id: 4,
      quantity: 1,
    ),
    Product(
      name: "Product 5",
      price: "18.75",
      image: "Assets/images/images.jpeg",
      description:
          "1. Watch, look, see imply being aware of things around one by perceiving them through the eyes\nTo watch is to be a spectator, to look on or observe, or to fix the attention upon during passage of time: to watch while a procession passes. To look is to direct the gaze with the intention of seeing, to use the eyesight with attention: to look for violets in the spring; to look at articles displayed for sale. To see is to perceive with the eyes, to obtain a visual impression, with or without fixing the attention: animals able to see in the dark}",
      id: 5,
      quantity: 1,
    ),
    Product(
      name: "Product 5",
      price: "18.75",
      image: "Assets/images/download.jpeg",
      description:
          "1. Watch, look, see imply being aware of things around one by perceiving them through the eyes\nTo watch is to be a spectator, to look on or observe, or to fix the attention upon during passage of time: to watch while a procession passes. To look is to direct the gaze with the intention of seeing, to use the eyesight with attention: to look for violets in the spring; to look at articles displayed for sale. To see is to perceive with the eyes, to obtain a visual impression, with or without fixing the attention: animals able to see in the dark}",
      id: 5,
      quantity: 1,
    )
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductGridView(adminlist: hardcodedProducts),
    );
  }
}
