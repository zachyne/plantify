// import 'package:csv/csv.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plantify/data/soil_data.dart';
import 'package:plantify/screens/homepage.dart';
import 'plantdetailspage.dart';

class AboutPlants extends StatefulWidget {
  const AboutPlants({super.key});

  @override
  _AboutPlants createState() => _AboutPlants();
}

class _AboutPlants extends State<AboutPlants> {
  List<List<dynamic>> _data = [];

  @override
  void initState() {
    super.initState();
    _loadCSV(); // Call _loadCSV() when the widget initializes
  }

  void _loadCSV() async {
    final rawData = await rootBundle.loadString('assets/plants_data.csv');
    List<List<dynamic>> listData = const CsvToListConverter().convert(rawData);
    setState(() {
      _data = listData;
    });
  }

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
              'About Plants',
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
        itemCount: _data.length,
        itemBuilder: (context, index) {
          final plantImage =
              _data[index][1].toString(); // Get image name as a String
          final plantNameEng = _data[index][2].toString();
          final plantNameTag = _data[index][3].toString();
          final plantDescription = _data[index][4].toString();
          // Basic Farming Guide
          final plantDep = _data[index][5].toString();
          final plantSpace = _data[index][6].toString();
          final plantWater = _data[index][7].toString();

          return ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/plants/$plantImage'),
              radius: 40, 
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    _data[index][2]
                        .toString(), // Assuming plant name is at index 2
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
                          plantNameEng: plantNameEng,
                          plantNameTag: plantNameTag,
                          plantDescription:
                              plantDescription, // Pass description for details
                          plantImage:
                              'assets/plants/$plantImage', // Pass image for details
                          plantDep: plantDep,
                          plantSpace: plantSpace,
                          plantWater: plantWater,
                          suitableSoilIds: _data[index][8] is String 
                            ? (_data[index][8] as String).split(',').map((e) => int.parse(e)).toList() 
                            : [_data[index][8] as int],
                          soils: soils, // Pass your soils list
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
              _data[index][4].toString(), // Assuming description is at index 4
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          );
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
}
