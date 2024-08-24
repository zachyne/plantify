class Plant {
  final int id;
  final String imagePath;
  final String name;
  final String scientificName;
  final String description;
  final String height;
  final String spacing;
  final String notes;
  final List<int> soilIds;
  
  // Add these properties if they exist in your data
  final String? plantWater; // Make these nullable if they're optional
  final String? plantSpace;
  final String? plantDep;

  Plant({
    required this.id,
    required this.imagePath,
    required this.name,
    required this.scientificName,
    required this.description,
    required this.height,
    required this.spacing,
    required this.notes,
    required this.soilIds,
    this.plantWater, // Initialize these as optional
    this.plantSpace,
    this.plantDep,
  });

  factory Plant.fromCsv(List<dynamic> csvRow) {
    List<int> parseSoilIds(dynamic soilIds) {
      if (soilIds is String) {
        return soilIds.split(',').map((id) => int.tryParse(id.trim()) ?? 0).toList();
      } else if (soilIds is int) {
        return [soilIds];
      } else if (soilIds is List<dynamic>) {
        return soilIds.map((id) => id is int ? id : int.tryParse(id.toString()) ?? 0).toList();
      } else {
        throw FormatException('Unexpected type for soilIds: ${soilIds.runtimeType}');
      }
    }

    if (csvRow.length < 9) {
      throw FormatException('Invalid CSV row: ${csvRow.length} elements found, expected at least 9.');
    }

    return Plant(
      id: int.tryParse(csvRow[0].toString()) ?? 0,
      imagePath: csvRow[1].toString(),
      name: csvRow[2].toString(),
      scientificName: csvRow[3].toString(),
      description: csvRow[4].toString(),
      height: csvRow[5].toString(),
      spacing: csvRow[6].toString(),
      notes: csvRow[7].toString(),
      soilIds: parseSoilIds(csvRow[8]),
      // Here you need to assign plantWater, plantSpace, plantDep if you have those columns in your CSV
      plantWater: csvRow.length > 9 ? csvRow[9]?.toString() : null,
      plantSpace: csvRow.length > 10 ? csvRow[10]?.toString() : null,
      plantDep: csvRow.length > 11 ? csvRow[11]?.toString() : null,
    );
  }
}
