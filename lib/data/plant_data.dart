// plant_data.dart

import 'package:flutter/material.dart';

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
    );
  }
}
