import 'package:flutter/material.dart';
import 'chicken_cat.dart';
import 'mutton_cat.dart';
class Category {
  final String title;
  final String imagePath;
  final String description;

  Category({required this.title, required this.imagePath, required this.description});
}

class CategoryDetailPage extends StatelessWidget {
  final List<Category> categories = [
    Category(
      title: "Chicken",
      imagePath: "assets/images/Naya1.png",
      description: "Raised on biosecure farms",
    ),
    Category(
      title: "Mutton",
      imagePath: "assets/images/mutton.jpeg",
      description: "Pasture raised lamb & goats",
    ),
    Category(
    title: 'Liver & More',
    imagePath: 'assets/images/liver2.jpeg',
    description: 'Rich & flavorful cuts of liver, kidney, Paya & more.',
    ),
    Category(
    title: 'Ready to Cook',
    imagePath: 'assets/images/ready_to_cook.jpeg',
    description: 'Freshly marinated meats',
    ),
    Category(
    title: 'Freshwater Fish',
    imagePath: 'assets/images/freshwater_fish.jpeg',
    description: 'Tender, fresh catch for curries & more',
    ),
    Category(
      title: 'Prawns and Carbs',
      imagePath: 'assets/images/prawns.jpeg',
      description: 'Freshly marinated meats',
    ),
    Category(
      title: 'Seawater Fish',
      imagePath: 'assets/images/seawater.jpeg',
      description: 'Tender, fresh catch for curries & more',
    ),


    // Add more categories as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Categories'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 0, // Set this to the desired elevation
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(categories[index].imagePath),
              ),
              title: Text(categories[index].title,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(categories[index].description),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                if (categories[index].title == "Chicken") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChickenCategoryPage()),
                      );
                }
                else if (categories[index].title == "Mutton") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MuttonCategoryPage(),

                ),
                  );
                }
                else {
          // Handle other categories if necessary
                }
              },


            ),
          );
        },
      ),
    );
  }
}
