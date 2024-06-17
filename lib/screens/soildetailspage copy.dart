import 'package:flutter/material.dart';
import 'package:plantify/data/soil_data.dart';

class SoilDetailsPage extends StatelessWidget {
  final Soil soil;  

  const SoilDetailsPage({Key? key, required this.soil}) : super(key: key);

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
            Text(
              "ABOUT ${soil.name}",
              style: const TextStyle(
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


      body: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Center(
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(soil.imagePath), 
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              soil.name, 
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              soil.description, 
              textAlign: TextAlign.center, // Add this to center the text
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              '${soil.name} Amendments', 
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              soil.amendments,
              textAlign: TextAlign.center,
            ), 
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              'Suitable Crops / Plants for ${soil.name}', 
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center, // Add this to center the text
            ),
          ),
          const SizedBox(height: 10),
          // Add crop items here (you'll need to fetch and display them dynamically)
        ],
      ),
      ),  

    );
  }
}