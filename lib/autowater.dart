import 'package:flutter/material.dart';
import 'package:optiscan/productdetail.dart';

class Autowatering extends StatefulWidget {
  @override
  _AutowateringState createState() => _AutowateringState();
}

class _AutowateringState extends State<Autowatering> {
  bool isSystemOn = false;
  bool isUnlocked = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.green,
        elevation: 0,
        toolbarHeight: 70,
        title: const Text(
          '        Water Your Plant Here',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildCircularBox('Humidity', 75, Colors.blue),
                        buildCircularBox('Soil Moisture', 60, Colors.brown),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildCircularBox('Temperature', 30, Colors.orange),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isSystemOn = !isSystemOn;
                      });
                      showSystemStatusDialog(context, isSystemOn);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isSystemOn ? Colors.red : Colors.black,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(
                          40), // Increase padding for larger button
                    ),
                    child: Text(
                      isSystemOn ? 'Turn Off' : 'Turn On',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'By pressing this button your \nsystem will automate & water \nwill be given to your plant',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              right: 0,
              child: Image.asset(
                'assets/water.png', // Replace with your image path
                width: 100,
                height: 100,
              ),
            ),
            if (!isUnlocked)
              Container(
                color: Colors.black.withOpacity(0.5),
              ),
            if (!isUnlocked)
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to purchase plans screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PurchasePlansScreen(onUnlock: () {
                          setState(() {
                            isUnlocked = true;
                          });
                        }),
                      ),
                    );
                  },
                  child: Text('Unlock'),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildCircularBox(String label, double percentage, Color color) {
    return Column(
      children: [
        SizedBox(
          width: 130,
          height: 130,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CircularProgressIndicator(
                value: percentage / 100,
                strokeWidth: 10,
                backgroundColor: Colors.grey.shade300,
                color: color,
              ),
              Center(
                child: Text(
                  '${percentage.toStringAsFixed(0)}%',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 3),
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  void showSystemStatusDialog(BuildContext context, bool isSystemOn) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isSystemOn ? 'Watering your plant' : 'Watering stopped'),
          content: Text(
            isSystemOn
                ? 'Your plant is now being watered.'
                : 'Thank you! Watering has been stopped.',
          ),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
