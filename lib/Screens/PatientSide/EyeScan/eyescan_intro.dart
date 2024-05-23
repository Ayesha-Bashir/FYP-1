import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:optiscan/Screens/PatientSide/EyeScan/display_image.dart';
import 'package:optiscan/Screens/PatientSide/Results/results.dart';
import 'package:optiscan/Screens/PatientSide/discalimer_screen.dart';
import 'package:optiscan/Screens/PatientSide/info_screen.dart';
import 'package:optiscan/constant.dart';

class EyeSCanIntro extends StatefulWidget {
  const EyeSCanIntro({super.key});

  @override
  State<EyeSCanIntro> createState() => _EyeSCanIntroState();
}

class _EyeSCanIntroState extends State<EyeSCanIntro> {
  String? imagePath;

  Future<void> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        imagePath = pickedFile.path;
      });
    }
  }

  void detectDisease() {
    if (imagePath == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('No Image Selected'),
          content: Text('Please select an image before detecting disease.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      // Simulate a scan delay
      Future.delayed(Duration(seconds: 5), () {
        functions.nextScreen(context, DisplayImage(imagePath: imagePath!));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,
        title: const Row(
          children: [
            // Removed the extra arrow icon here
            Text(
              'HOW TO SCAN DISEASE',
              style: TextStyle(color: Colors.white),
            ),
            Spacer(),
            Icon(
              CupertinoIcons.qrcode,
              color: Colors.white,
            ),
          ],
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50))),
        ),
      ),
      backgroundColor: scaffoldColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Choose an image from the gallery or take a new one using the camera.',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Container(
              width: width * 0.6,
              height: height * 0.4,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: imagePath == null
                  ? Center(child: Text('No image selected.'))
                  : Image.file(File(imagePath!)),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () => pickImage(ImageSource.gallery),
                  icon: Icon(Icons.photo),
                  label: Text('Open Gallery'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () => pickImage(ImageSource.camera),
                  icon: Icon(Icons.camera),
                  label: Text('Open Camera'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Results()),
                );
              },
              child: Text('Detect Disease'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      functions.nextScreen(context, const DisclaimerScreen());
                    },
                    child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: const Color(0xffEDEDED),
                            borderRadius: BorderRadius.circular(10)),
                        height: 40,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '📝DISCLAIMER',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
