import 'package:flutter/material.dart';
import 'package:plantify/components/appbar.dart';
import 'package:plantify/screens/homepage.dart';
import 'soildetailspage.dart';
import 'package:plantify/data/soil_data.dart';
// import 'scan_soil.dart';
// import 'upload_soil.dart';

class AboutSoils extends StatelessWidget {
  const AboutSoils({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PlantifyAppBar(title: 'About Soils'),
      body: ListView.builder(
        itemCount: soils.length,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            leading: Container(
              width: 80, // Set container width for consistent spacing
              height: 80, // Set container height for consistent spacing
              decoration: BoxDecoration(
                shape: BoxShape.circle, // Make the container circular
                image: DecorationImage(
                  image: AssetImage(soils[index].imagePath),
                  fit: BoxFit.cover, // Make image fit the circle
                ),
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    soils[index].name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            SoilDetailsPage(soil: soils[index]),
                        transitionDuration:
                            const Duration(seconds: 0), // Instant transition
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
              soils[index].description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          );
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
}
