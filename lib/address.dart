import 'package:flutter/material.dart';

import 'checkout.dart';

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final _formKey = GlobalKey<FormState>();
  String _addressType = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Address'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Flat / Building name / Street name',
                  border: OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              // ... Add other TextFormFields for Landmark, City, Mobile number, Email, Full Name
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Mobile number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your mobile number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),

              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),


              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),

              // ... More fields ...
              ListTile(
                title: Text('Save As'),
                trailing: Wrap(
                  spacing: 12, // space between two icons
                  children: <Widget>[
                    ChoiceChip(
                      label: Text('Home'),
                      selected: _addressType == 'Home',
                      onSelected: (bool selected) {
                        setState(() {
                          _addressType = 'Home';
                        });
                      },
                    ),
                    ChoiceChip(
                      label: Text('Work'),
                      selected: _addressType == 'Work',
                      onSelected: (bool selected) {
                        setState(() {
                          _addressType = 'Work';
                        });
                      },
                    ),
                    ChoiceChip(
                      label: Text('Other'),
                      selected: _addressType == 'Other',
                      onSelected: (bool selected) {
                        setState(() {
                          _addressType = 'Other';
                        });
                      },
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CheckoutPage()));

                    // Save the address information
                  }
                },
                child: Text('Save & Proceed'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
