import 'package:flutter/material.dart';
import 'package:plantify/components/appbar.dart';

import 'package:plantify/data/soil_data.dart';
import 'package:plantify/screens/homepage.dart';
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
      appBar: PlantifyAppBar(title: plantNameTag),
      body: SingleChildScrollView(
        child: Column(
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
                          image: AssetImage(plantImage),
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
                            plantNameTag, // Plant name tag
                            style: const TextStyle(
                              color: Colors.white, // White text color
                              fontSize: 44, // Font size for the tag
                              fontWeight: FontWeight.bold, // Bold text
                            ),
                          ),
                          Text(
                            plantNameEng, // Plant English name
                            style: const TextStyle(
                              color: Colors.white, // White text color
                              fontSize: 24, // Font size for the English name
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
                    child: Text(
                      plantDescription,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        height: 1.0,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Center(
                    child: Text(
                      "Basic Farming Guide",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Center(
                    child: Text(
                      "DEPTHS TO PLANT",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      plantDep,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      "SPACING REQUIREMENTS",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      plantSpace,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      "WATERING NEEDS",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      plantWater,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      "SUITABLE SOIL TYPES",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Center(
                      child: Column(
                        children: suitableSoils.map((soil) {
                          return ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 0), // Remove default padding
                            title: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.center, // Center the row
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: AssetImage(soil.imagePath),
                                    radius: 30, // Set the radius to 30 pixels
                                  ),
                                  const SizedBox(
                                      width:
                                          10), // Add some space between the avatar and the text
                                  Text(soil.name,
                                      style: const TextStyle(
                                        fontSize: 20,
                                      )),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      SoilDetailsPage(soil: soil),
                                  transitionDuration: const Duration(
                                      seconds: 0), // Instant transition
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
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
}
