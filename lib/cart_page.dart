import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';
import 'address.dart'; // Ensure this file contains AddressPage class

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Consumer<CartModel>(
        builder: (context, cart, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {
                    var cartItemKey = cart.items.keys.elementAt(index);
                    var cartItem = cart.items[cartItemKey];
                    return ListTile(
                      leading: Icon(Icons.food_bank),
                      title: Text(cartItem?.title ?? 'Unknown Item'),
                      subtitle: Text('Quantity: ${cartItem?.quantity ?? 0}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('₹${(cartItem?.price ?? 0.0) * (cartItem?.quantity ?? 0)}'),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              cart.removeItem(cartItemKey);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Card(
                margin: EdgeInsets.all(15),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Total:',
                        style: TextStyle(fontSize: 20),
                      ),
                      Spacer(),
                      Chip(
                        label: Text(
                          '₹${cart.totalAmount.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Theme.of(context).textTheme.titleMedium?.color,
                          ),
                        ),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AddressPage(),
                            ),
                          );
                        },
                        child: Text('ORDER NOW'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
