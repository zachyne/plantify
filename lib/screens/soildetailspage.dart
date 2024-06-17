// lib/screens/soil_details_page.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'package:plantify/data/soil_data.dart';
import 'package:plantify/screens/plantdetailspage.dart';
import '../data/plant_data.dart';
import '../data/csv_loader.dart';

class SoilDetailsPage extends StatelessWidget {
  final Soil soil;

  const SoilDetailsPage({Key? key, required this.soil}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ABOUT ${soil.name}",
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF163020),
          ),
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
            print('No plant data available');
            return const Center(child: Text('No plant data available'));
          } else {
            final plants = getPlantsForSoil(soil.id, snapshot.data!);
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                      textAlign: TextAlign.center,
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
                  const Center(
                    child: Text(
                      'Suitable Crops / Plants',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...plants.map((plant) => ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                    title: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/plants/${plant.imagePath}'),
                          ),
                          const SizedBox(width: 10),
                          Text(plant.name),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlantDetailsPage(
                            plantNameEng: plant.name,
                            plantNameTag: plant.scientificName,
                            plantDescription: plant.description,
                            plantImage: 'assets/plants/${plant.imagePath}',
                            plantDep: plant.height,
                            plantSpace: plant.spacing,
                            plantWater: plant.notes,
                            suitableSoilIds: plant.soilIds,
                            soils: soils,
                          ),
                        ),
                      );
                    },
                  )).toList(),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  List<Plant> getPlantsForSoil(int soilId, List<Plant> plants) {
    return plants.where((plant) => plant.soilIds.contains(soilId)).toList();
  }
}
