import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:developer' as devtools;

import 'package:plantify/features/result_page.dart';
import 'not_soil.dart'; // Import NotSoil page

class ScanSoil extends StatefulWidget {
  const ScanSoil({super.key});

  @override
  State<ScanSoil> createState() => _ScanSoilState();
}

class _ScanSoilState extends State<ScanSoil> {
  File? filePath;
  String label = '';
  double confidence = 0.0;

  Future<void> _loadModel(String modelPath, String labelPath) async {
    String? res = await Tflite.loadModel(
      model: modelPath,
      labels: labelPath,
      numThreads: 1,
      isAsset: true,
      useGpuDelegate: false,
    );
    devtools.log(res ?? 'Model loading failed');
  }

  Future<void> _classifyImage(String imagePath) async {
    var recognitions = await Tflite.runModelOnImage(
        path: imagePath,
        imageMean: 0.0,
        imageStd: 255.0,
        numResults: 2,
        threshold: 0.2,
        asynch: true);

    if (recognitions == null || recognitions.isEmpty) {
      devtools.log("Recognitions is Null");
      return;
    }

    setState(() {
      confidence = (recognitions[0]['confidence'] * 100);
      label = recognitions[0]['label'].toString();
    });
  }

  Future<void> _predictSoil(String imagePath) async {
    await _loadModel(
        "assets/model/soil_or_not_model.tflite", "assets/model/soilOrNot.txt");
    await _classifyImage(imagePath);

    if (label == "Soil") {
      await _loadModel("assets/model/soiltype_final_model_app.tflite",
          "assets/model/labelsModel.txt");
      await _classifyImage(imagePath);

      // Navigate to ResultPage if the image is soil
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(
            imageFile: filePath!,
            label: label,
            confidence: confidence,
          ),
        ),
      );
    } else {
      // Navigate to NotSoil page if the image is not soil
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NotSoil(),
        ),
      );
    }
  }

  Future<void> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);

    if (image == null) return;

    var imageMap = File(image.path);
    setState(() {
      filePath = imageMap;
    });

    await _predictSoil(image.path);
  }

  @override
  void dispose() {
    super.dispose();
    Tflite.close();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/logos/plain_logo.png',
              height: 40,
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
            const Text(
              'Scan Your Soil!',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF163020),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Text(
                'For best results, collect a sample of your soil, place it in a white bond paper, moisturize it a little bit, and take a picture with good lighting!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12.0,
                  color: Color(0xFF163020),
                  height: 1.0,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(
                    color: const Color(0xFF163020),
                    width: 2), // Adjust width as needed
                borderRadius:
                    BorderRadius.circular(8), // Adjust border radius as needed
              ),
              child: const Center(
                child: Icon(
                  Icons.upload_rounded,
                  size: 80,
                  color: Color(0xFF163020),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => pickImage(ImageSource.camera),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF163020),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                foregroundColor: Colors.black,
              ),
              child: const Text(
                "Scan Soil",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFEEF0E5),
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
