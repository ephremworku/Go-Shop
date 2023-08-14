import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductScreen(),
    );
  }
}

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  String selectedShoppingList = 'Clothes';
  String selectedRecommendation = 'For Your Hair';

  List<String> shoppingLists = [
    'Clothes',
    'Groceries',
    'Cosmetics',
    // Add more shopping list items as needed
  ];

  List<String> recommendations = [
    'For Your Hair',
    'For Your Skin',
    'For Your Body Shape',
    // Add more recommendation items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite"),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DropdownButton<String>(
              value: selectedShoppingList,
              items: shoppingLists.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedShoppingList = newValue!;
                });
              },
            ),
            DropdownButton<String>(
              value: selectedRecommendation,
              items: recommendations.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedRecommendation = newValue!;
                });
              },
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10, // Number of API response items
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text("API Response Item $index"),
                subtitle: Text("Additional info about the item"),
                // Add more customization here if needed
              );
            },
          ),
        ),
      ],
    );
  }
}

