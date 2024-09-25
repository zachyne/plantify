import 'package:flutter/material.dart';
import 'package:plantify/components/appbar.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PlantifyAppBar(title: 'About Us'),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 100),
              Image.asset(
                'assets/logos/logo_with_name.png',
                height: 100, // Adjust logo size as needed
              ),
              const SizedBox(height: 20),
              const Text(
                'The Team',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20.0,
                  color: Color(0xFF163020),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'We are a group of students from Biliran Province State University who are passionate of creating an innovation that can help people love farming through using our expertise and skills as Computer Science students.',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12.0,
                      color: Color(0xFF163020),
                      height: 1.2),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Members',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15.0,
                  color: Color(0xFF163020),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      // Jansen
                      Image.asset(
                        'assets/aboutus/jansen.png',
                        height: 100, // Adjust logo size as needed
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'JANSEN C. SOLAYAO',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                          color: Color(0xFF163020),
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const Text(
                        'Team Leader',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 10.0,
                            color: Color(0xFF163020),
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),

                  // Jeneth
                  Column(
                    children: [
                      Image.asset(
                        'assets/aboutus/jeneth.png',
                        height: 100, // Adjust logo size as needed
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'JENETH M. ESTRELLER',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                          color: Color(0xFF163020),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Field Researcher',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 10.0,
                            color: Color(0xFF163020),
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      // MJ
                      Image.asset(
                        'assets/aboutus/mj.png',
                        height: 100, // Adjust logo size as needed
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'MARC JASON C. CATABAY',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                          color: Color(0xFF163020),
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const Text(
                        'Field Researcher',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 10.0,
                            color: Color(0xFF163020),
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      // Cyrine
                      Image.asset(
                        'assets/aboutus/cycy.png',
                        height: 100, // Adjust logo size as needed
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'CYRINE B. MALESIDO',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                          color: Color(0xFF163020),
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const Text(
                        'Developer',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 10.0,
                            color: Color(0xFF163020),
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'Adviser',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15.0,
                  color: Color(0xFF163020),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  // Sir J
                  Image.asset(
                    'assets/aboutus/sir.png',
                    height: 200, // Adjust logo size as needed
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'SIR EVAN',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12.0,
                      color: Color(0xFF163020),
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Text(
                    'Thesis Adviser',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 10.0,
                        color: Color(0xFF163020),
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'About Plantify',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15.0,
                  color: Color(0xFF163020),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'This mobile application is created as a requirement for the completion of our thesis project. This will not be possible without the help of our adviser, our school, and our university.',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12.0,
                      color: Color(0xFF163020),
                      height: 1.2),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Acknowledgement',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15.0,
                  color: Color(0xFF163020),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/aboutus/stcs.png',
                    height: 150, // Adjust logo size as needed
                  ),
                  const SizedBox(width: 10),
                  Image.asset(
                    'assets/aboutus/bipsu.png',
                    height: 150, // Adjust logo size as needed
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'All Rights Reserved 2024',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 10.0,
                  color: Color(0xFF163020),
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
