// lib/data/csv_loader.dart

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import '../data/plant_data.dart';

Future<List<Plant>> loadPlantsData() async {
  try {
    final data = await rootBundle.loadString('assets/plants_data.csv');
    final csvData = const CsvToListConverter().convert(data);
    return csvData.skip(1).map((row) => Plant.fromCsv(row)).toList();
  } catch (e) {
    print('Error parsing CSV: $e');
    throw e;
  }
}
