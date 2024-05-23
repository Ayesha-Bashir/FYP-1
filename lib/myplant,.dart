import 'package:flutter/material.dart';
import 'dart:io'; // For handling image file
import 'package:image_picker/image_picker.dart'; // For picking images from gallery or camera

class Plant {
  final String name;
  final String health;
  final String height;
  final String image;

  Plant({
    required this.name,
    required this.health,
    required this.height,
    required this.image,
  });
}

class AddPlantScreen extends StatefulWidget {
  @override
  _AddPlantScreenState createState() => _AddPlantScreenState();
}

class _AddPlantScreenState extends State<AddPlantScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _healthController = TextEditingController();
  final _heightController = TextEditingController();
  File? _image;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate() && _image != null) {
      final newPlant = Plant(
        name: _nameController.text,
        health: _healthController.text,
        height: _heightController.text,
        image: _image!.path,
      );
      Navigator.pop(context, newPlant);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields and select an image')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Plant'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Plant Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the plant name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _healthController,
                decoration: InputDecoration(labelText: 'Plant Health'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the plant health';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _heightController,
                decoration: InputDecoration(labelText: 'Plant Height'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the plant height';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Pick Image'),
              ),
              if (_image != null) Image.file(_image!),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
