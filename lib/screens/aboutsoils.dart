import 'package:flutter/material.dart';
import 'soildetailspage.dart';
import 'package:plantify/data/soil_data.dart';
// import 'scan_soil.dart';
// import 'upload_soil.dart';



class AboutSoils extends StatelessWidget {
  const AboutSoils({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Align items to the edges
          children: [
            Image.asset(
              'assets/logos/plain_logo.png',
              height: 40, // Adjust logo size as needed
            ),
            const Text(
              'About Soils',
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
                        builder: (context) =>
                            SoilDetailsPage(soil: soils[index]),
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
            ),
          );
        },
      ),
    );
  }
}
