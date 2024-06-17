import 'package:flutter/material.dart';

import 'package:plantify/data/soil_data.dart';
import 'soildetailspage.dart';

class PlantDetailsPage extends StatelessWidget {
  final String plantNameEng;
  final String plantNameTag;
  final String plantDescription;
  final String plantImage;
  final String plantDep;
  final String plantSpace;
  final String plantWater;
  final List<int> suitableSoilIds;
  final List<Soil> soils;

  const PlantDetailsPage({
    super.key,
    required this.plantNameEng,
    required this.plantNameTag,
    required this.plantDescription,
    required this.plantImage,
    required this.plantDep,
    required this.plantSpace,
    required this.plantWater,
    required this.suitableSoilIds,
    required this.soils,
  });

  @override
  Widget build(BuildContext context) {
    List<Soil> suitableSoils =
        soils.where((soil) => suitableSoilIds.contains(soil.id)).toList();

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
              "ABOUT $plantNameEng",
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
                    image: AssetImage(plantImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                plantNameEng,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                plantNameEng,
                style: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Text(
                plantDescription,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            const Center(
              child: Text(
                "Basic Farming Guide",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Center(
              child: Text(
                "DEPTHS TO PLANT",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                plantDep,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                "SPACING REQUIREMENTS",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                plantSpace,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                "WATERING NEEDS",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                plantWater,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                "SUITABLE SOIL TYPES",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Center(
                child: Column(
                  children: suitableSoils.map((soil) {
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 0), // Remove default padding
                      title: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center, // Center the row
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: AssetImage(soil.imagePath),
                            ),
                            const SizedBox(width: 10), // Add some space between the avatar and the text
                            Text(soil.name),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SoilDetailsPage(soil: soil), // Pass the soil object
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
