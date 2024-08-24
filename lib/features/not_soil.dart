import 'package:flutter/material.dart';
import 'package:plantify/features/scan_soil.dart';
import 'package:plantify/screens/homepage.dart';

import 'upload_soil.dart';

class NotSoil extends StatelessWidget {
  const NotSoil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Align items to the edges
          children: [
            Image.asset(
              'assets/logos/plain_logo.png',
              height: 40, // Adjust logo size as needed
            ),
          ],
        ),
        backgroundColor: const Color(0xFFEEF0E5),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/soil/error.png', height: 200),
            const SizedBox(height: 20),
            const Text(
              'The image is not a soil',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF163020),
              ),
            ),
            const SizedBox(height: 20),
            const Text("Give it another try?"),
            const SizedBox(height: 20),
            SizedBox(
              width: 150, // Set a fixed width (adjust as needed)
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                    const Color(0xFF163020), // Background color
                  ),
                  textStyle: WidgetStateProperty.all<TextStyle>(
                    const TextStyle(
                      fontWeight:
                          FontWeight.w600, // Semi-bold (w600 is equivalent)
                      fontSize: 18.0, // Optional: Set font size
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ScanSoil()),
                  );
                },
                child: const Text(
                  'Scan Soil',
                  style: TextStyle(
                    color: Color(0xFFEEF0E5),
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: 150, // Set a fixed width (adjust as needed)
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                    const Color(0xFF163020), // Background color
                  ),
                  textStyle: WidgetStateProperty.all<TextStyle>(
                    const TextStyle(
                      fontWeight:
                          FontWeight.w600, // Semi-bold (w600 is equivalent)
                      fontSize: 18.0, // Optional: Set font size
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UploadSoil()),
                  );
                },
                child: const Text(
                  'Upload Soil',
                  style: TextStyle(
                    color: Color(0xFFEEF0E5),
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the home page
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomePage()),
            (Route<dynamic> route) => false,
          );
        },
        backgroundColor: const Color(0xFF163020),
        tooltip: 'Home',
        child: const Icon(
          Icons.home,
          color: Color(0xFFEEF0E5),
        ),
      ),
    );
  }
}
