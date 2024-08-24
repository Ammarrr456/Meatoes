import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';
import 'cart_page.dart';

class ChickenProduct {
  final String name;
  final String imagePath;
  final String description;
  final double price;

  ChickenProduct({
    required this.name,
    required this.imagePath,
    required this.description,
    required this.price,
  });
}

class ChickenCategoryPage extends StatelessWidget {
  final List<ChickenProduct> products = [
    ChickenProduct(
  name: 'Chicken Curry Cut - Small Pieces',
  imagePath: 'assets/images/Chicken_curry_small.png',
  description: 'Juicy bone-in & boneless chicken for delectable curries',
  price: 159.0,
  ),
  ChickenProduct(
  name: 'Chicken Breast - Boneless',
  imagePath: 'assets/images/chicken_breast_boneless.png',
  description: 'Enjoy tender pieces of juicy chicken breast',
  price: 285.0,
  ),
  ChickenProduct(
  name: 'Chicken Curry Cut - Large Pieces',
  imagePath: 'assets/images/Chicken_curry_large.png',
  description: 'Large Juicy bone-in & boneless pieces for delicious curries',
  price: 180.0,
  ),
  ChickenProduct(
  name: 'Premium Chicken Thigh Boneless',
  imagePath: 'assets/images/Thigh.png',
  description: 'Chicken Thighs (Boneless) is a juicy cut that doesnt dry out easily',
  price: 159.0,
  ),
  ChickenProduct(
  name: 'Chicken Boneless-Mini Bites',
  imagePath: 'assets/images/mini_bites.png',
  description: 'Juicy, tender goodness of Chicken in a mouthful',
  price: 200.0,
  ),
  ChickenProduct(
  name: 'Chicken Drumstick - Pack Of 6',
  imagePath: 'assets/images/drum.png',
  description: 'Juicy bone-in chicken drumsticks, cut from the leg',
  price: 300.0,
  ),
  // Add more products as needed
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chicken Products'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Image.asset(
                    product.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        product.description,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 10),
                      Text(
                        '₹${product.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          Provider.of<CartModel>(context, listen: false).addProduct(
                            product.name,
                            product.price,
                          );

                          // Navigate to the CartPage
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CartPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text('Add'),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
