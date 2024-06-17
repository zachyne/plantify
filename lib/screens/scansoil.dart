import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite_v2/tflite_v2.dart';
import 'dart:io';
import 'package:gallery_saver/gallery_saver.dart';
import 'resultspage.dart';

class ScanSoil extends StatefulWidget {
  const ScanSoil({super.key});

  @override
  _ScanSoilScreenState createState() => _ScanSoilScreenState();
}

class _ScanSoilScreenState extends State<ScanSoil> {
  CameraController? controller;
  List<CameraDescription>? cameras;
  XFile? imageFile;

  @override
  void initState() {
    super.initState();
    loadModel();
    initializeCamera();
  }

  Future<void> loadModel() async {
    try {
      String? res = await Tflite.loadModel(
        model: 'assets/model/model.tflite', 
        labels: 'assets/model/labelsModel.txt', 
      );
      print('Model loaded: $res');
    } catch (e) {
      print('Error loading model: $e');
    }
  }

  Future<void> initializeCamera() async {
    try {
      cameras = await availableCameras();
      if (cameras != null && cameras!.isNotEmpty) {
        controller = CameraController(cameras![0], ResolutionPreset.medium);
        await controller!.initialize();
        if (mounted) {
          setState(() {});
        }
      } else {
        print('No cameras available');
      }
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Future<void> captureImage() async {
    if (controller != null && controller!.value.isInitialized) {
      try {
        final image = await controller!.takePicture();
        setState(() {
          imageFile = image;
        });
        print('Image captured: ${image.path}');
        await GallerySaver.saveImage(image.path, albumName: "Camera Roll");
        predictSoilType(image.path);
      } catch (e) {
        print('Error capturing image: $e');
      }
    }
  }

  Future<void> predictSoilType(String imagePath) async {
    try {
      List<dynamic>? output = await Tflite.runModelOnImage(
        path: imagePath,
        numResults: 6,
        threshold: 0.2,
        asynch: true,
      );

      String soilType = 'Unknown';

      if (output != null && output.isNotEmpty) {
        soilType = output[0]['label'];
      }

      print('Prediction result: $soilType');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsPage(soilType: soilType),
        ),
      );
    } catch (e) {
      print('Error predicting soil type: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller!.value.isInitialized) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    } else {
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Scan Your Soil!",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF163020),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20), 
                  child: const Center(
                    child: Text(
                      "Place your soil in a white bond paper, moisturize it a little bit, and take a picture with a good lighting!",
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
                Container(
                  height: 250, 
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10), 
                    border: Border.all(color: Colors.grey[300]!, width: 2),
                  ),
                  child: imageFile != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            File(imageFile!.path),
                            fit: BoxFit.cover, 
                          ),
                        )
                      : controller != null && controller!.value.isInitialized
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CameraPreview(controller!),
                            )
                          : const Center(
                              child: CircularProgressIndicator()), 
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: captureImage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF163020), 
                  ),
                  child: const Text(
                    'Predict Soil',
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
        ),
      );
    }
  }
}
