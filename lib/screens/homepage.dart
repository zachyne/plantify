import 'package:flutter/material.dart';
import 'package:plantify/components/appbar.dart';
import 'package:plantify/features/scan_soil.dart';
import 'package:plantify/screens/aboutus.dart';
import 'aboutsoils.dart';
import 'aboutplants.dart';
import 'package:plantify/features/upload_soil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Screen dimensions
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Dynamic sizes
    double buttonWidth =
        screenWidth * 0.4; // Adjust button width relative to screen width
    double buttonHeight =
        screenHeight * 0.06; // Adjust button height relative to screen height
    double buttonFontSize =
        screenWidth * 0.05; // Adjust font size for ElevatedButton child Text

    return Scaffold(
      appBar: const PlantifyAppBar(
        title: 'Plantify',
        showBackButton: false,
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/leaves_background.png', // Your background image
              fit: BoxFit.cover, // Cover the entire screen
            ),
          ),
          // Main content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'What do you want to do?',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20.0,
                    color: Color(0xFF163020),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                // Elevated Buttons
                SizedBox(
                  width: buttonWidth,
                  height: buttonHeight,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF163020), // Background color
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const ScanSoil(),
                          transitionDuration: const Duration(seconds: 0),
                        ),
                      );
                    },
                    child: Text(
                      'Scan Soil',
                      style: TextStyle(
                        color: const Color(0xFFEEF0E5),
                        fontWeight: FontWeight.bold,
                        fontSize: buttonFontSize, // Responsive font size
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: buttonWidth,
                  height: buttonHeight,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF163020), // Background color
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const UploadSoil(),
                          transitionDuration: const Duration(seconds: 0),
                        ),
                      );
                    },
                    child: Text(
                      'Upload Soil',
                      style: TextStyle(
                        color: const Color(0xFFEEF0E5),
                        fontWeight: FontWeight.bold,
                        fontSize: buttonFontSize, // Responsive font size
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'or read about',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Color(0xFF163020),
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: buttonWidth,
                  height: buttonHeight,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF163020), // Background color
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const AboutSoils(),
                          transitionDuration: const Duration(seconds: 0),
                        ),
                      );
                    },
                    child: Text(
                      'Soils',
                      style: TextStyle(
                        color: const Color(0xFFEEF0E5),
                        fontWeight: FontWeight.bold,
                        fontSize: buttonFontSize, // Responsive font size
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: buttonWidth,
                  height: buttonHeight,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF163020), // Background color
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const AboutPlants(),
                          transitionDuration: const Duration(seconds: 0),
                        ),
                      );
                    },
                    child: Text(
                      'Plants',
                      style: TextStyle(
                        color: const Color(0xFFEEF0E5),
                        fontWeight: FontWeight.bold,
                        fontSize: buttonFontSize, // Responsive font size
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 150),
                // Redirect to About Us page
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Want to know more ',
                      style: TextStyle(
                        fontSize: screenWidth *
                            0.05, // Responsive font size for "Want to know more"
                        color: const Color(0xFF163020),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const AboutUs(),
                            transitionDuration: const Duration(seconds: 0),
                          ),
                        );
                      },
                      child: Text(
                        'about us',
                        style: TextStyle(
                          color: const Color(0xFF163020),
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth *
                              0.05, // Responsive font size for InkWell link
                        ),
                      ),
                    ),
                    Text(
                      '?',
                      style: TextStyle(
                        fontSize:
                            screenWidth * 0.035, // Responsive font size for "?"
                        color: const Color(0xFF163020),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
