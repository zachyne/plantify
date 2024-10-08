import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plantify/components/appbar.dart';
import 'dart:developer' as devtools;

import 'package:plantify/features/result_page.dart';
import 'not_soil.dart'; // Import NotSoil page

class UploadSoil extends StatefulWidget {
  const UploadSoil({super.key});

  @override
  State<UploadSoil> createState() => _UploadSoilState();
}

class _UploadSoilState extends State<UploadSoil> {
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
          builder: (context) => const NotSoil(),
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
      appBar: const PlantifyAppBar(title: 'Upload Soil'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Upload Your Soil Image!',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF163020),
              ),
              textAlign: TextAlign.center,
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
              onPressed: () => pickImage(ImageSource.gallery),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF163020),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                foregroundColor: Colors.black,
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Upload Soil",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFEEF0E5),
                  ),
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
