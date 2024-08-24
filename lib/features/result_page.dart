import 'dart:io';
import 'package:flutter/material.dart';
import 'package:plantify/data/plant_data.dart';
import 'package:plantify/data/soil_data.dart';
import 'package:plantify/screens/homepage.dart';
import 'package:plantify/screens/plantdetailspage.dart';
import '../data/csv_loader.dart';

class ResultPage extends StatelessWidget {
  final File imageFile;
  final String label;
  final double confidence;

  const ResultPage({
    super.key,
    required this.imageFile,
    required this.label,
    required this.confidence,
  });

  @override
  Widget build(BuildContext context) {
    // Get the soil ID based on the label
    final soilIdMap = {
      'Chalky Soil': 1,
      'Clay Soil': 2,
      'Loamy Soil': 3,
      'Peaty Soil': 4,
      'Sandy Soil': 5,
      'Silty Soil': 6,
    };

    final soilId = soilIdMap[label] ?? 0;

    // Get the Soil object based on the soilId
    final Soil? soil = soils.firstWhere((soil) => soil.id == soilId,
        orElse: () => Soil(
            id: 0,
            name: 'Unknown',
            imagePath: '',
            description: 'No description available.',
            amendments: ''));

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
              'Results',
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
      body: FutureBuilder<List<Plant>>(
        future: loadPlantsData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print('Error loading plant data: ${snapshot.error}');
            return const Center(child: Text('Error loading plant data'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No plant data available'));
          } else {
            final plants = getPlantsForSoilByLabel(label, snapshot.data!);
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.file(
                          imageFile,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 16, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              label,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              '${confidence.toStringAsFixed(2)}%',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      soil?.description ?? 'No description available.',
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: Text(
                      "Suitable Crops / Plants for $label",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...plants.map((plant) {
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 16),
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/plants/${plant.imagePath}'),
                        radius: 40,
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              plant.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PlantDetailsPage(
                                    plantNameEng: plant.name,
                                    plantNameTag: plant.scientificName,
                                    plantDescription: plant.description,
                                    plantImage:
                                        'assets/plants/${plant.imagePath}',
                                    plantDep: plant.height,
                                    plantSpace: plant.spacing,
                                    plantWater: plant.notes,
                                    suitableSoilIds: plant.soilIds,
                                    soils: soils,
                                  ),
                                ),
                              );
                            },
                            child: const Text(
                              'view details',
                              style: TextStyle(
                                color: Colors.green,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        plant.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }).toList(),
                ],
              ),
            );
          }
        },
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

  List<Plant> getPlantsForSoilByLabel(String soilLabel, List<Plant> plants) {
    final soilIdMap = {
      'Chalky Soil': 1,
      'Clay Soil': 2,
      'Loamy Soil': 3,
      'Peaty Soil': 4,
      'Sandy Soil': 5,
      'Silty Soil': 6,
    };

    final soilId = soilIdMap[soilLabel] ?? 0;
    return plants.where((plant) => plant.soilIds.contains(soilId)).toList();
  }
}
