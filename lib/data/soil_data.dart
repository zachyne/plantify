export 'soil_data.dart';

class Soil {
  final int id;
  final String name;
  final String imagePath;
  final String description;
  final String amendments;

  Soil(
      {required this.id,
      required this.name,
      required this.imagePath,
      required this.description,
      required this.amendments});
}

List<Soil> soils = [
  Soil(
      id: 1,
      name: 'Chalky Soil',
      imagePath: 'assets/soil/chalky.jpg',
      description:
          'The chalky ground is usually light and easy to work with in any season. At the same time, it contains stony inclusions. The good news is that chalky types of soil drain well, so you won’t have to worry about it. However, rapid drainage, especially in hot weather, can cause the ground to dry out. \n \n The problem with the chalky field is that it is too alkaline and deficient in certain minerals such as iron and manganese. Plants grown in the chalky ground are often stunted and have yellowish leaves. Thus, you must use the proper kind of fertilizer to balance the pH to grow healthy crops.',
      amendments:
          "Mulching around plant crowns and plenty of organic matter, such as humus, manure, composted pine needles, or leaf mold."),
  Soil(
      id: 2,
      name: 'Clay Soil',
      imagePath: 'assets/soil/clay.jpg',
      description:
          'Clay’s heavy and compact structure holds moisture well and is ideal for moisture-loving plants. Many crops will thrive in this type of soil due to the high nutrient content. Meanwhile, clay is frequently alkaline which stops plants from getting all the nutrients they require to flourish and produce a high yield. \n \n Clay warms up slowly making it unsuitable for sowing plants in early spring. A significant disadvantage of this soil type is that it is rather challenging to work with: it often becomes sticky and waterlogged in winter and turns into solid blocks when it dries up in summer.',
      amendments: "Compost and other organic matter."),
  Soil(
      id: 3,
      name: 'Loamy Soil',
      imagePath: 'assets/soil/loamy.webp',
      description:
          'Loam comprises three different materials: silt, clay, and sand. The variety in particle sizes creates openings in the ground that allow air, water, and roots to pass through freely. Loam doesn’t dry too fast; it is soft and almost effortless to till. \n \n Loam type of soil contains all of the nutrients required for active plant growth. It also has high calcium and pH levels, as well as hummus. The minerals soluble in water easily nourish plants’ roots, resulting in high yields.',
      amendments: "Any organic amendments at least once a year."),
  Soil(
      id: 4,
      name: 'Peaty Soil',
      imagePath: 'assets/soil/peaty.jpg',
      description:
          'The peat structure is spongy and resistant to compaction, so it heats up quickly and retains water well. It has good aeration and allows the roots of the plants to breathe. The absence of pathogens distinguishes peat soil types. Because it contains few harmful bacteria, the peaty ground is an excellent choice for seed starting. Its acidic condition limits plant nutrient availability, so you’ll need to supplement crop production with fertilizer. \n \n The major drawback of peaty ground is that it is a non-renewable resource. A decrease in peaty ground quantity can contribute to climate change by releasing greenhouse gases into the atmosphere.',
      amendments: "Sand, compost, mulch, and other drain-improving materials."),
  Soil(
      id: 5,
      name: 'Sandy Soil',
      imagePath: 'assets/soil/sandy.jpg',
      description:
          'The main advantage of the sandy type is that it is suitable for early planting because it is the first to warm up after winter. It is not too prone to erosion due to the large size of the particles. Sandy ground has a loose structure which makes it effortless to till. For the same reason, water quickly seeps into the lower layers of the ground, washing away nutrients with it. Additionally, the sandy type is often acidic, meaning it has a low pH level. Plants growing in sandy soils may thus be deficient in the nutrients and moisture necessary for their growth.',
      amendments:
          "Plenty of organic mulches, peat moss, compost, zeolite, or bentonite clay."),
  Soil(
      id: 6,
      name: 'Silty Soil',
      imagePath: 'assets/soil/silty.jpg',
      description:
          'Silty ground particles have physical properties somewhere between those of sand and clay. Because of its fine texture, silt holds more water than sand. Silty types of soil are fertile and contain a sufficient number of nutrients. Most plants will thrive when the drainage system is channelized correctly for silt. \n \n When there is enough moisture, this type of ground is soft and smooth, so that it is easy to cultivate. The disadvantage of silt is that it compacts easily making it difficult to till when it dries out.',
      amendments: "Drainage aid particles, such as sand or compost."),
];
