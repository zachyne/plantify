import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final String soilType;

  const ResultsPage({super.key, required this.soilType});

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
              "Results Page",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF163020),
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFFEEF0E5),
      ),
      body: Center(
        child: Text(
          'The soil type is: $soilType',
          style: const TextStyle(fontSize: 24),
        ),
      )
    );
  }
}
