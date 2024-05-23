import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:optiscan/constant.dart';

class AddStore extends StatefulWidget {
  const AddStore({super.key});

  @override
  State<AddStore> createState() => _AddStoreState();
}

class _AddStoreState extends State<AddStore> {
  bool selectedImage = false;
  XFile? _image;
  final TextEditingController storeNameController = TextEditingController();
  final TextEditingController storePhoneNumberController =
      TextEditingController();
  final TextEditingController storeAboutController = TextEditingController();

  bool get isFormValid {
    return selectedImage &&
        storeNameController.text.isNotEmpty &&
        storePhoneNumberController.text.isNotEmpty &&
        storeAboutController.text.isNotEmpty;
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Plane has been added to app successfully!'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                // You can add more actions here, like navigating back or clearing the form
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        backgroundColor: scaffoldColor,
        elevation: 0,
        title: Text(
          'Add New Plane For Watering Kits',
          style: TextStyle(color: blueColor),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            InkWell(
              onTap: () async {
                final imagePicker = ImagePicker();
                final XFile? pickedFile =
                    await imagePicker.pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  setState(() {
                    _image = pickedFile;
                    selectedImage = true;
                  });
                }
              },
              child: Container(
                height: _image == null ? 100 : null,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: blueColor),
                ),
                child: _image == null
                    ? const Text('Add Kit Image')
                    : Image.file(
                        File(_image!.path), // Convert XFile to File
                        fit: BoxFit.contain,
                      ),
              ),
            ),
            const SizedBox(height: 10),
            _buildTextField(storeNameController, 'Enter Plane Name'),
            const SizedBox(height: 10),
            _buildTextField(storePhoneNumberController, 'Enter Kit Type'),
            const SizedBox(height: 10),
            _buildTextField(storeAboutController, 'Enter Kit Price'),
            const SizedBox(height: 20),
            InkWell(
              onTap: isFormValid
                  ? () {
                      _showSuccessDialog();
                    }
                  : null,
              child: Container(
                height: 40,
                width: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isFormValid ? blueColor : Colors.grey,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  'Add Plane',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0xffDDDDDD),
            blurRadius: 15.0,
            spreadRadius: 2.0,
            offset: Offset(0.0, 0.0),
          )
        ],
      ),
      child: TextFormField(
        controller: controller,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          border: InputBorder.none,
        ),
        onChanged: (value) {
          setState(() {});
        },
      ),
    );
  }
}
