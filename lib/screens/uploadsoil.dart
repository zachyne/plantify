// ignore_for_file: library_private_types_in_public_api

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadSoil extends StatefulWidget {
  const UploadSoil({super.key});

  @override
  _UploadSoilState createState() => _UploadSoilState();
}

class _UploadSoilState extends State<UploadSoil> {
  File? _image;
  bool _isImageUploaded = false;

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2), // Light background
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align items to the edges
          children: [
            Image.asset(
              'assets/logos/plain_logo.png',
              height: 40, // Adjust logo size as needed
            ),
            const Text(
              'Plantify',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF163020),
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFFEEF0E5),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Upload Your Soil!',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF163020),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20), // Adjust value as needed
              child: const Center(
                child: 
                Text(
                  "Upload a picture of your soil in a white bond paper, moisturize it a little bit, and take a picture with a good lighting!",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15.0,
                    color: Color(0xFF163020),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Upload Icon Placeholder
            Container(
              height: 250, // Adjust size as needed
              width: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10), // Slightly rounded corners
                border: Border.all(color: Colors.grey[300]!, width: 2),
              ),
              child: _image!= null
                 ? Image.file(_image!, fit: BoxFit.cover) // Use BoxFit.cover to display the image in a square
                  : const Icon(
                      Icons.upload_file,
                      size: 100,
                      color: Color(0xFF1A4323), // Dark green icon
                    ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(
                  const Color(0xFF163020), // Background color
                ),
                textStyle: WidgetStateProperty.all<TextStyle>(
                  const TextStyle(
                    fontWeight: FontWeight.w600, // Semi-bold (w600 is equivalent)
                    fontSize: 18.0, // Optional: Set font size
                  ),
                ),
              ),
              onPressed: () async {
                if (!_isImageUploaded) {
                  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    if (image!= null) {
                      _image = File(image.path);
                      _isImageUploaded = true;
                    } else {
                      _image = null;
                    }
                  });
                } else {
                  // Add your predict soil logic here
                }
              },
              child: _isImageUploaded
                 ? const Text('Predict Soil',
                      style: TextStyle(
                        color: Color(0xFFEEF0E5),
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),)
                  : const Text('Upload Soil',
                      style: TextStyle(
                        color: Color(0xFFEEF0E5),
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      }