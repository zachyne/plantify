import 'package:flutter/material.dart';
import 'aboutsoils.dart';
import 'aboutplants.dart';
import 'scansoil.dart';
import 'uploadsoil.dart';
// import 'scan_soil.dart';
// import 'upload_soil.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            
            const Text(
              'What do you want to do?',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 24.0,
                color: Color(0xFF163020),
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            // Elevated Buttons

             SizedBox(
              width: 150, // Set a fixed width (adjust as needed)
              child: ElevatedButton(
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ScanSoil()),
                );
              },
              child: const Text('Scan Soil',
                  style: TextStyle(
                    color: Color(0xFFEEF0E5),
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),),
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
                    fontWeight: FontWeight.w600, // Semi-bold (w600 is equivalent) 
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
              child: const Text('Upload Soil',
                  style: TextStyle(
                    color: Color(0xFFEEF0E5),
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),),
             ),
            ),
  
            const SizedBox(height: 15),

            const Text(
              'or read',
              style: TextStyle(
                fontSize: 15.0,
                color: Color(0xFF163020),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: 150, // Set a fixed width (adjust as needed)
              child: ElevatedButton(
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutSoils()),
                );
              },
              child: const Text('About Soil',
                  style: TextStyle(
                    color: Color(0xFFEEF0E5),
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),),
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
                    fontWeight: FontWeight.w600, // Semi-bold (w600 is equivalent) 
                    fontSize: 18.0, // Optional: Set font size
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPlants()),
                );
              },
              child: const Text('About Plants',
                  style: TextStyle(
                    color: Color(0xFFEEF0E5),
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),),
             ),
            ),

            
          ],
        ),
      ),
    );
  }
}
