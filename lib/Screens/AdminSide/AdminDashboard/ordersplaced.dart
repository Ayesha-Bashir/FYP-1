import 'package:flutter/material.dart';

class OrdersPlacedScreen extends StatefulWidget {
  const OrdersPlacedScreen({super.key});

  @override
  State<OrdersPlacedScreen> createState() => _OrdersPlacedScreenState();
}

class _OrdersPlacedScreenState extends State<OrdersPlacedScreen> {
  // Sample order data
  List<Map<String, String>> orders = [
    {
      "name": "Plane 1: basic kit",
      "price": "\$19.99",
      "buyerName": "John Doe",
      "email": "john.doe@example.com",
      "phone": "123-456-7890",
      "address": "123 Main St, Cityville, USA"
    },
    {
      "name": "Plane 2: premium kit",
      "price": "\$29.99",
      "buyerName": "Jane Smith",
      "email": "jane.smith@example.com",
      "phone": "987-654-3210",
      "address": "456 Elm St, Townsville, USA"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Orders Placed',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"), // Your background image
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              orders[index]["name"]!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const SizedBox(height: 8),
                            Text("Price: ${orders[index]["price"]!}"),
                            const SizedBox(height: 8),
                            Text("Buyer Name: ${orders[index]["buyerName"]!}"),
                            const SizedBox(height: 8),
                            Text("Email: ${orders[index]["email"]!}"),
                            const SizedBox(height: 8),
                            Text("Phone: ${orders[index]["phone"]!}"),
                            const SizedBox(height: 8),
                            Text("Address: ${orders[index]["address"]!}"),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed: () {
                                    setState(() {
                                      orders.removeAt(index);
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
