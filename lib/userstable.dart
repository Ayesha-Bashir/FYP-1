import 'package:flutter/material.dart';

class UserCreatedAccountsScreen extends StatefulWidget {
  @override
  _UserCreatedAccountsScreenState createState() =>
      _UserCreatedAccountsScreenState();
}

class _UserCreatedAccountsScreenState extends State<UserCreatedAccountsScreen> {
  List<Map<String, String>> userAccounts = [
    {
      'Name': 'John Doe',
      'Email': 'john@example.com',
      'Date': '2024-05-20',
    },
    {
      'Name': 'Kenny Smith',
      'Email': 'kenny@example.com',
      'Date': '2024-05-21',
    },
    // Add more user accounts here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Newly Created Accounts'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'User Accounts',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: userAccounts.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          userAccounts[index]['Name']![0],
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.green,
                      ),
                      title: Text(userAccounts[index]['Name']!),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Email: ${userAccounts[index]['Email']}'),
                          Text('Date: ${userAccounts[index]['Date']}'),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          _deleteAccount(context, index);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _deleteAccount(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Account'),
          content: Text('Are you sure you want to delete this account?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                setState(() {
                  userAccounts.removeAt(index);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
