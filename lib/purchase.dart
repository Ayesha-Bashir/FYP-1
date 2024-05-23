import 'package:flutter/material.dart';
import 'package:optiscan/userdetail.dart';

class PurchasePlansScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Purchase Plans'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Plan 1
          Card(
            child: ListTile(
              title: Text('Plan 1: Basic Kit'),
              subtitle: Text('\$19.99'),
              trailing: ElevatedButton(
                onPressed: () {
                  // Navigate to user info screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserInfoScreen(
                        planDetails: 'Basic Kit: \$19.99',
                        onUnlock: () {},
                      ),
                    ),
                  );
                },
                child: Text('Buy Now'),
              ),
            ),
          ),
          // Plan 2
          Card(
            child: ListTile(
              title: Text('Plan 2: Advanced Kit'),
              subtitle: Text('\$29.99'),
              trailing: ElevatedButton(
                onPressed: () {
                  // Navigate to user info screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserInfoScreen(
                        planDetails: 'Advanced Kit: \$29.99',
                        onUnlock: () {},
                      ),
                    ),
                  );
                },
                child: Text('Buy Now'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
