import 'dart:io';
import 'package:flutter/material.dart';

class DisplayImage extends StatelessWidget {
final String imagePath='assets/leaf.png';

  // ignore: prefer_const_constructors_in_immutables
  DisplayImage({super.key, imagePath});

  @override
  Widget build(BuildContext context) {
    print('Image path: $imagePath');
    print('File exists: ${File(imagePath).existsSync()}');

    return Scaffold(
      appBar: AppBar(
        title: Text('Display Image'),
      ),
      body: Center(
        child: imagePath.isNotEmpty
            ? Image.file(
                File(imagePath),
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  print('Error loading image: $exception');
                  return Text('Error loading image');
                },
              )
            : Text('No image selected'),
      ),
    );
  }
}
