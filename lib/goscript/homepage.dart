import 'package:flutter/material.dart';
import 'favorite.dart';
import 'homepage.dart';
import 'product.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: FirstScreen(),
//     );
//   }
// }

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String dropdownValue = 'English'; // Default selected language

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Color.fromRGBO(0, 120, 20, 0.7),
      title: Text("Go Shopping"),
      leading: IconButton(
        
        icon: Icon(Icons.menu),
        onPressed: () {
          // Implement your menu action here
        },
      ),
      actions: [
        DropdownButton<String>(
          value: dropdownValue,
          items: <String>['English', 'Spanish', 'French'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
            // Implement language change action here
          },
        ),
      ],
    );
  }

  Widget buildBody() {
    // Fetch API data and build the scrollable container
    // You can use a ListView.builder or other suitable widget here

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children:[
        SizedBox(height: 20),
        buildButtonWithIcon("Product", Icons.shopping_cart),
        buildButtonWithIcon("Scan", Icons.camera_alt),
        buildButtonWithIcon("Favorite", Icons.favorite),
        SizedBox(height: 20),
      ],
         
          ),
        ],
    );
  }

  Widget buildButtonWithIcon(String text, IconData iconData) {
    return TextButton.icon(
      onPressed: () {
        // Implement button actions here()
        if(text == "Favorite"){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductScreen()));
        }
        if(text == "Product"){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductsScreen()));
        }
      },
      icon: Icon(iconData),
      label: Text(text),
    );
  }
}

