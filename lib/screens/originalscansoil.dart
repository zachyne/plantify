// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:tflite/tflite.dart';
// import 'dart:io';

// class ScanSoil extends StatefulWidget {
//   const ScanSoil({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _ScanSoilScreenState createState() => _ScanSoilScreenState();
// }

// class _ScanSoilScreenState extends State<ScanSoil> {
//   CameraController? controller;
//   List<CameraDescription>? cameras;
//   XFile? imageFile;

//   @override
//   void initState() {
//     super.initState();
//     initializeCamera();
//     // model
//     loadModel();
//   }

//   Future<void> loadModel() async {
//   String? res = await Tflite.loadModel(
//     model: 'assets/model.tflite', // Path to your model file
//     labels: 'assets/labels.txt',   // Path to your labels file
//   );
//   print(res);
// }

//   Future<void> initializeCamera() async {
//     cameras = await availableCameras();
//     controller = CameraController(cameras![0], ResolutionPreset.medium);
//     await controller!.initialize();
//     if (mounted) {
//       setState(() {});
//     }
//   }

//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }

//   Future<void> captureImage() async {
//     if (controller!.value.isInitialized) {
//       try {
//         final image = await controller!.takePicture();
//         setState(() {
//           imageFile = image;
//         });
//       } catch (e) {
//         print('Error capturing image: $e');
//         // Handle the error appropriately (e.g., show a snackbar or dialog)
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (controller == null || !controller!.value.isInitialized) {
//       return Container();
//     } else {
//       return Scaffold(
//         backgroundColor: const Color(0xFFF2F2F2), // Light background
//         appBar: AppBar(
//           title: Row(
//             mainAxisAlignment:
//                 MainAxisAlignment.spaceBetween, // Align items to the edges
//             children: [
//               Image.asset(
//                 'assets/logos/plain_logo.png',
//                 height: 40, // Adjust logo size as needed
//               ),
//               const Text(
//                 'Plantify',
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontSize: 24.0,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF163020),
//                 ),
//               ),
//             ],
//           ),
//           backgroundColor: const Color(0xFFEEF0E5),
//         ),
//         body: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text(
//                   "Scan Your Soil!",
//                   style: TextStyle(
//                     fontFamily: 'Poppins',
//                     fontSize: 24.0,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFF163020),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 20), // Adjust value as needed
//                   child: const Center(
//                     child: Text(
//                       "Place your soil in a white bond paper, moisturize it a little bit, and take a picture with a good lighting!",
//                       style: TextStyle(
//                         fontFamily: 'Poppins',
//                         fontSize: 15.0,
//                         color: Color(0xFF163020),
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Container(
//                   height: 250, // Adjust size as needed
//                   width: 250,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius:
//                         BorderRadius.circular(10), // Slightly rounded corners
//                     border: Border.all(color: Colors.grey[300]!, width: 2),
//                   ),
//                   child: imageFile != null
//                       ? ClipRRect(
//                           // Clip the image to match the container's shape
//                           borderRadius: BorderRadius.circular(10),
//                           child: Image.file(
//                             File(imageFile!.path),
//                             fit: BoxFit
//                                 .cover, // Fill the container while maintaining aspect ratio
//                           ),
//                         )
//                       : controller != null && controller!.value.isInitialized
//                           ? ClipRRect(
//                               // Clip the camera preview to match the container's shape
//                               borderRadius: BorderRadius.circular(10),
//                               child: CameraPreview(controller!),
//                             )
//                           : const Center(
//                               child:
//                                   CircularProgressIndicator()), // Loading indicator
//                 ),
//                 const SizedBox(height: 20),
//                 imageFile == null
//                     ? ElevatedButton(
//                         onPressed: () async {
//                           // Capture image and process (your logic here)
//                           XFile picture = await controller!.takePicture();
//                           setState(() {
//                             imageFile = picture;
//                           });
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor:
//                               const Color(0xFF163020), // Dark green background
//                           shape: const CircleBorder(), //Circular shape
//                           padding: const EdgeInsets.all(
//                               35), // Increase padding for larger circle
//                           side: const BorderSide(
//                               color: Color(0xFFEEF0E5),
//                               width: 5), // Off-white border
//                           elevation: 0, // Remove default elevation shadow
//                         ),
//                         child:
//                             null, // Remove the text child, as the image has no text
//                       )
//                     : ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor:
//                               const Color(0xFF163020), // Backgroun d color
//                         ),
//                         onPressed: () {
//                           // logic
//                         },
//                         child: const Text(
//                           'Predict Soil',
//                           style: TextStyle(
//                             color: Color(0xFFEEF0E5),
//                             fontWeight: FontWeight.bold,
//                             fontSize: 15.0,
//                           ),
//                         ),
//                       )
//               ],
//             ),
//           ),
//         ),
//       );
//     }
//   }
// }
