import 'package:flutter/material.dart';

class PlantCareTips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.green,
        elevation: 0,
        toolbarHeight: 70,
        title: const Text(
          'Plant Care Tips & Recommendations',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildHeadingBox('Care Tips'),
                const SizedBox(height: 10),
                buildKeyPoints([
                  'Water your plants regularly.',
                  'Ensure adequate sunlight exposure.',
                  'Use nutrient-rich soil.',
                  'Prune dead leaves and branches.',
                ]),
                const SizedBox(height: 20),
                buildHeadingBox('Recommendations'),
                const SizedBox(height: 10),
                buildRecommendationContent(),
                const SizedBox(height: 20),
                buildStatisticsGraph(),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Your report has been downloaded successfully!'),
                          action: SnackBarAction(
                            label: 'OK',
                            onPressed: () {},
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    child: Text(
                      'Download Report',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeadingBox(String heading) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        heading,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.green.shade800,
        ),
      ),
    );
  }

  Widget buildKeyPoints(List<String> points) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: points
          .map((point) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Icon(Icons.check, color: Colors.green),
                    const SizedBox(width: 10),
                    Expanded(
                        child: Text(point, style: TextStyle(fontSize: 16))),
                  ],
                ),
              ))
          .toList(),
    );
  }

  Widget buildRecommendationContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'To ensure optimal plant health, follow these recommendations:',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 10),
        buildKeyPoints([
          'Monitor soil moisture levels daily.',
          'Adjust watering schedules based on weather conditions.',
          'Use organic fertilizers every month.',
          'Inspect plants regularly for pests and diseases.',
        ]),
      ],
    );
  }

  Widget buildStatisticsGraph() {
    return Container(
      height: 200,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Plant Health Statistics',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildStatisticBar('Temperature', 30, Colors.orange),
                buildStatisticBar('Moisture', 35, Colors.brown),
                buildStatisticBar('Humidity', 32, Colors.blue),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStatisticBar(String label, double percentage, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 40,
          height: percentage * 2, // Scale the height for better visualization
          color: color,
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        Text(
          '${percentage.toStringAsFixed(0)}%',
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
