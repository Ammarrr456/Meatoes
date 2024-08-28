import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';
import 'cart_page.dart';

class MuttonProduct {
  final String name;
  final String imagePath;
  final String description;
  final double price;

  MuttonProduct({
    required this.name,
    required this.imagePath,
    required this.description,
    required this.price,
  });
}

class MuttonCategoryPage extends StatelessWidget {
  final List<MuttonProduct> products = [
    //... List of MuttonProduct instances
    MuttonProduct(
      name: 'Goat Curry Cut - Small Pieces',
      imagePath: 'assets/images/mutton_curry.png',
      description: 'Perfectly cut small pieces of goat for curry',
      price: 200.0,
    ),
    MuttonProduct(
      name: 'Pure Goat Mince',
      imagePath: 'assets/images/mince.png',
      description: 'Finely ground goat mince for curries, kebabs & more',
      price: 350.0,
    ),
    MuttonProduct(
      name: 'Goat Boneless',
      imagePath: 'assets/images/boneless.png',
      description: 'Bite-sized fat-trimmed cuts for pan-fried delicacies',
      price: 350.0,
    ),
    MuttonProduct(
      name: 'Mutton Liver - Chunks',
      imagePath: 'assets/images/liver1.png',
      description: 'Cut & cleaned Mutton Liver for pan-fried dishes',
      price: 350.0,
    ),
    MuttonProduct(
      name: 'Mutton Paya/Trotters (Whole): Pack of 4',
      imagePath: 'assets/images/paya.png',
      description: 'Finely goat payas for curries & more',
      price: 350.0,
    ),
    MuttonProduct(
      name: 'Mutton Brain (Bheja)',
      imagePath: 'assets/images/bheja.png',
      description: 'Premium Mutton Brain for rich, creamy dishes',
      price: 350.0,
    ),

    //... More products
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mutton Products'),
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
