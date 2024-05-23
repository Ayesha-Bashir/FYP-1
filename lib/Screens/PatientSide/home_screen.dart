import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:optiscan/Screens/PatientSide/Available%20Doctors/all_doctors.dart';
import 'package:optiscan/Screens/PatientSide/AvailableStores/all_stores.dart';
import 'package:optiscan/Screens/PatientSide/EyeScan/eyescan_intro.dart';
import 'package:optiscan/Screens/PatientSide/PatientProfile/patient_editprofile.dart';
import 'package:optiscan/Screens/PatientSide/PatientProfile/patient_profile.dart';
import 'package:optiscan/Screens/PatientSide/feedback.dart';
import 'package:optiscan/autowater.dart';
import 'package:optiscan/constant.dart';
import 'package:optiscan/myplant,.dart';
import 'package:optiscan/recom.dart';
import 'package:optiscan/shop.dart';

class PatientHome extends StatefulWidget {
  const PatientHome({super.key});

  @override
  State<PatientHome> createState() => _PatientHomeState();
}

class _PatientHomeState extends State<PatientHome> {
  List imageList = [
    {"id": 1, "image_path": 'assets/h1.png'},
    {"id": 2, "image_path": 'assets/h2.png'},
    {"id": 3, "image_path": 'assets/h3.png'},
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        backgroundColor: scaffoldColor,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Colors.green),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Ayesha',
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            SizedBox(width: 10),
            CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('assets/pf.jpg'),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                functions.nextScreen(context, PatientHome());
              },
            ),
            ListTile(
              leading: Icon(Icons.feedback),
              title: Text('Give Feedbacks'),
              onTap: () {
                functions.nextScreen(context, GetFeedbackScreen());
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                functions.nextScreen(context, PatientProfile());
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                functions.popScreen(context);
                functions.popScreen(context);
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                print(currentIndex);
              },
              child: CarouselSlider(
                items: imageList
                    .map(
                      (item) => Image.asset(
                        item['image_path'],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                    height: 180,
                    scrollPhysics: BouncingScrollPhysics(),
                    autoPlay: true,
                    aspectRatio: 2,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageList.map((url) {
                int index = imageList.indexOf(url);
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == index
                        ? Color.fromRGBO(0, 0, 0, 0.9)
                        : Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                );
              }).toList(),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: Column(
                    children: [
                      SizedBox(height: 1),
                      Text(
                        'Explore Features',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      FeatureBox(
                        title: "Plant Disease \nDetection",
                        icon: 'assets/search.png',
                        onTap: () {
                          functions.nextScreen(context, const EyeSCanIntro());
                        },
                      ),
                      FeatureBox(
                        title: "Plant Auto \nWatering",
                        icon: 'assets/PREM.png',
                        onTap: () {
                          functions.nextScreen(context, Autowatering());
                        },
                      ),
                      FeatureBox(
                        title: "Plant Care Tips \nand Recommendations",
                        icon: 'assets/tips.png',
                        onTap: () {
                          functions.nextScreen(context, PlantCareTips());
                        },
                      ),
                      FeatureBox(
                        title: "My Plants",
                        icon: 'assets/myplants.png',
                        onTap: () {
                          functions.nextScreen(context, AddPlantScreen());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureBox extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;

  const FeatureBox({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(15)),
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 120,
                width: 120,
                child: Image.asset(
                  icon,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                '$title >>',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
