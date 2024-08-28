import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'category.dart';

class ThankYouPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meatoes'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        color: Colors.orange, // Background color
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Shop our freshest meats and much more',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontStyle: FontStyle.italic,
              ),
            ),


            ElevatedButton(
              child: Text('Next'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  CategoryDetailPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.orange, // Text color
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
