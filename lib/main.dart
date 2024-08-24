import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:plantify/screens/startpage.dart';
import 'package:plantify/screens/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstTimeUser = prefs.getBool('first_time_user') ?? true;

  runApp(MyApp(isFirstTimeUser: isFirstTimeUser));
}

class MyApp extends StatelessWidget {
  final bool isFirstTimeUser;

  const MyApp({super.key, required this.isFirstTimeUser});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plantify',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFEEF0E5),
        fontFamily: 'Poppins',
      ),
      home: isFirstTimeUser ? const StartPage() : const HomePage(),
    );
  }
}
