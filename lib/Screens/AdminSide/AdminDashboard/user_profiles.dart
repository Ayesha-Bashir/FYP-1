import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:optiscan/constant.dart';

class UserProfiles extends StatefulWidget {
  const UserProfiles({super.key});

  @override
  State<UserProfiles> createState() => _UserProfilesState();
}

class _UserProfilesState extends State<UserProfiles> {
  @override
  final List<Map<String, String>> userAccounts = [
    {
      'Name': 'John Doe',
      'Email': 'john@example.com',
      'Feedback': 'All Good Here, Nice User Friendly Interface⭐⭐⭐⭐⭐',
    },
    {
      'Name': 'Kenne Smith',
      'Email': 'kenny@example.com',
      'Feedback': 'Well Done!⭐⭐⭐⭐',
    },
    // Add more user accounts here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users Feedback!'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'All Feedbacks',
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
                          Text('Feedback: ${userAccounts[index]['Feedback']}'),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.check, color: Colors.green),
                        onPressed: () {},
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
}
