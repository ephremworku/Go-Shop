import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductDetailScreen(
        productName: "Sample Product",
        productDescription: "This is a sample product description.",
        productRating: 4.5,
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final String productName;
  final String productDescription;
  final double productRating;
  // You can add more attributes as needed

  ProductDetailScreen({
    required this.productName,
    required this.productDescription,
    required this.productRating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildProductImage(),
          SizedBox(height: 20),
          Text(
            "Description:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10),
          Text(productDescription),
          SizedBox(height: 20),
          buildRatingSection(),
        ],
      ),
    );
  }

  Widget buildProductImage() {
    return Image.asset(
      'assets/product_image.png', // Replace with the actual image asset path
      width: double.infinity,
      height: 200,
      fit: BoxFit.cover,
    );
  }

  Widget buildRatingSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Rating:",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(width: 10),
        buildRatingStars(),
      ],
    );
  }

  Widget buildRatingStars() {
    return Row(
      children: List.generate(
        productRating.round(),
        (index) => Icon(Icons.star, color: Colors.yellow),
      ),
    );
  }
}

