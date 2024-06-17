import 'package:flutter/material.dart';
import 'package:plantify/screens/homepage.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF163020),
              ),
            ),
            const Text(
              'Know your soil, Know your plants',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15.0,
                color: Color(0xFF163020),
              ),
            ),
            const SizedBox(height: 30.0),
            Image.asset('assets/logos/logo_with_name.png', height: 100),
            const SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
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
                  child: const Text('Get Started',
                  style: TextStyle(
                    color: Color.fromARGB(255, 236, 245, 198),
                    fontWeight: FontWeight.bold,
                  ),),
                ),
          ],
        ), 
      )
    );
  }
}