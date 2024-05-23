import 'package:flutter/material.dart';

class UserInfoScreen extends StatefulWidget {
  final String planDetails;
  final VoidCallback onUnlock;

  UserInfoScreen({required this.planDetails, required this.onUnlock});

  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _address = '';
  String _email = '';
  String _number = '';
  bool _paymentOnDelivery = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Information'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(widget.planDetails, style: TextStyle(fontSize: 18)),
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                onSaved: (value) => _name = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Address'),
                onSaved: (value) => _address = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                onSaved: (value) => _email = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Number'),
                onSaved: (value) => _number = value ?? '',
              ),
              CheckboxListTile(
                title: Text('Payment on delivery'),
                value: _paymentOnDelivery,
                onChanged: (value) {
                  setState(() {
                    _paymentOnDelivery = value ?? false;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    // Confirm the order
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Order Confirmed'),
                        content: Text(
                          'Your order has been placed successfully!\n'
                          'You will be notified when your order will be shipped & our rider will contact you when he reaches at your location.\n'
                          'Thank you for placing order.',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              widget.onUnlock();
                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: Text('Confirm'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
