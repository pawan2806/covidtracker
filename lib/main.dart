import 'package:flutter/material.dart';
import 'package:covidtracker/screens/screens.dart';
import 'package:http/http.dart' as http;
import 'config/palette.dart';
import 'package:covidtracker/screens/bottom_nav_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVID 19 TRACKER',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BottomNavScreen(),

    );
  }
}
