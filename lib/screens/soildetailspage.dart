// lib/screens/soil_details_page.dart

import 'package:flutter/material.dart';
import 'package:plantify/components/appbar.dart';
import 'package:plantify/data/soil_data.dart';
import 'package:plantify/screens/homepage.dart';
import 'package:plantify/screens/plantdetailspage.dart';
import '../data/plant_data.dart';
import '../data/csv_loader.dart';

class SoilDetailsPage extends StatelessWidget {
  final Soil soil;

  const SoilDetailsPage({super.key, required this.soil});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PlantifyAppBar(title: soil.name),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      width: double.infinity, // Full width of the screen
                      height: 300, // Set the height to 300 pixels
                      child: Stack(
                        children: [
                          // Background image
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(soil.imagePath),
                                fit: BoxFit
                                    .cover, // Maintain aspect ratio and cover the entire container
                              ),
                            ),
                          ),
                          // Green gradient overlay
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  const Color(0xFF163020).withOpacity(
                                      0.9), // Green color with opacity at the bottom
                                  Colors.transparent, // Transparent at the top
                                ],
                              ),
                            ),
                          ),
                          // Positioned text widgets for plant name
                          Positioned(
                            bottom: 16, // Distance from the bottom
                            left: 16, // Distance from the left
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start, // Align text to the start (left)
                              children: [
                                Text(
                                  soil.name, // Plant name tag
                                  style: const TextStyle(
                                    color: Colors.white, // White text color
                                    fontSize: 44, // Font size for the tag
                                    fontWeight: FontWeight.bold, // Bold text
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Center(
                          child: Text(
                            "DESCRIPTION",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: Text(soil.description,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontSize: 20,
                                height: 1.0,
                              )),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: Text(
                            '${soil.name} Amendments',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: Text(
                            soil.amendments,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Center(
                          child: Text(
                            'Suitable Crops / Plants',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ...plants.map((plant) => ListTile(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              title: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    // Replace CircleAvatar with Container for square image
                                    Container(
                                      width: 50, // Set width for square shape
                                      height: 50, // Set height equal to width
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/plants-no-bg/${plant.imagePath}'),
                                          fit: BoxFit
                                              .cover, // Ensure the image covers the entire container
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            8), // Optional: rounded corners
                                      ),
                                    ),
                                    const SizedBox(
                                        width:
                                            10), // Space between image and text
                                    Text(
                                      plant.name,
                                      style: const TextStyle(
                                        // Optional: Make the text bold
                                        fontSize:
                                            20, // Optional: Adjust font size
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        PlantDetailsPage(
                                      plantNameEng: plant.name,
                                      plantNameTag: plant.scientificName,
                                      plantDescription: plant.description,
                                      plantImage:
                                          'assets/plants-no-bg/${plant.imagePath}',
                                      plantDep: plant.height,
                                      plantSpace: plant.spacing,
                                      plantWater: plant.notes,
                                      suitableSoilIds: plant.soilIds,
                                      soils: soils,
                                    ),
                                    transitionDuration: const Duration(
                                        seconds: 0), // Instant transition
                                  ),
                                );
                              },
                            ))
                      ],
                    ),
                  ),
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
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const HomePage(),
              transitionDuration:
                  const Duration(seconds: 0), // Instant transition
            ),
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

  List<Plant> getPlantsForSoil(int soilId, List<Plant> plants) {
    return plants.where((plant) => plant.soilIds.contains(soilId)).toList();
  }
}
