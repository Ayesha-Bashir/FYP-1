import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:optiscan/Screens/AdminSide/AdminDashboard/add_store.dart';
import 'package:optiscan/Screens/AdminSide/AdminDashboard/non_verified_docs.dart';
import 'package:optiscan/Screens/AdminSide/AdminDashboard/ordersplaced.dart';
import 'package:optiscan/Screens/AdminSide/AdminDashboard/registered_doctors.dart';
import 'package:optiscan/Screens/AdminSide/AdminDashboard/registered_stores.dart';
import 'package:optiscan/Screens/AdminSide/AdminDashboard/user_profiles.dart';
import 'package:optiscan/Screens/PatientSide/AvailableStores/all_stores.dart';
import 'package:optiscan/constant.dart';
import 'package:optiscan/userstable.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: scaffoldColor,
        title: Text(
          'Dashboard',
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              functions.popScreen(context);
              functions.popScreen(context);
            },
            icon: Icon(
              Icons.exit_to_app_outlined,
              color: Colors.green,
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/w1.png'), // Replace with your background image asset
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 90,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () => functions.nextScreen(
                          context, UserCreatedAccountsScreen()),
                      child: Container(
                        alignment: Alignment.center,
                        height: 80,
                        width: 150,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 5.0,
                              spreadRadius: 1.0,
                              offset: const Offset(0.0, 0.0),
                            )
                          ],
                          color: Colors.green,
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        child: Text(
                          'Accounts\nCreated',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () =>
                          functions.nextScreen(context, const AddStore()),
                      child: Container(
                        alignment: Alignment.center,
                        height: 80,
                        width: 150,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 5.0,
                              spreadRadius: 1.0,
                              offset: const Offset(0.0, 0.0),
                            )
                          ],
                          color: Colors.green,
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        child: Text(
                          'Add New\nShop Plane',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => functions.nextScreen(
                          context, const RegisteredStores()),
                      child: Container(
                        alignment: Alignment.center,
                        height: 80,
                        width: 150,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 5.0,
                              spreadRadius: 1.0,
                              offset: const Offset(0.0, 0.0),
                            )
                          ],
                          color: Colors.green,
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        child: Text(
                          'Add\n New Admin',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () =>
                          functions.nextScreen(context, const UserProfiles()),
                      child: Container(
                        alignment: Alignment.center,
                        height: 80,
                        width: 150,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 5.0,
                              spreadRadius: 1.0,
                              offset: const Offset(0.0, 0.0),
                            )
                          ],
                          color: Colors.green,
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        child: Text(
                          'Users\n Feedback',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        functions.nextScreen(context, OrdersPlacedScreen());
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 80,
                        width: 150,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 5.0,
                              spreadRadius: 1.0,
                              offset: const Offset(0.0, 0.0),
                            )
                          ],
                          color: Colors.green,
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        child: Text(
                          'Orders \nPlaced',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UserCreatedAccountsScreen extends StatelessWidget {
  final List<Map<String, String>> userAccounts = [
    {
      'Name': 'John Doe',
      'Email': 'john@example.com',
      'Date': '2024-05-20',
    },
    {
      'Name': 'Jane Smith',
      'Email': 'jane@example.com',
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
                // Handle delete account logic here
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
