import 'package:covidtracker/screens/home_screen.dart';
import 'package:covidtracker/screens/precautions_screen.dart';
import 'package:covidtracker/screens/screens.dart';
import 'package:covidtracker/screens/states_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';


class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {

  int _currentIndex = 0;
  final List _screens = [
    HomeScreen(),
    StatePage(),
    ShopScreen(),
    Scaffold(),
    Scaffold(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        //currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        backgroundColor: Color(0xFFd4f3ef),
        color: Color(0xFF9ab3f5),
        buttonBackgroundColor: Color(0xFF7579e7),

        animationCurve: Curves.decelerate,
//        type: BottomNavigationBarType.fixed,
//        backgroundColor: Colors.black,
//        showSelectedLabels: false,
//        showUnselectedLabels: false,
//        selectedItemColor: Colors.white,
//        unselectedItemColor: Colors.white70,
//        elevation: 0.0,
        items: <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
        ],
//        items: [Icons.home, Icons.insert_chart, Icons.email]
//            .asMap()
//            .map((key, value) => MapEntry(
//          key,
//          BottomNavigationBarItem(
//            title: Text(''),
//            icon: Container(
//              padding: const EdgeInsets.symmetric(
//                vertical: 6.0,
//                horizontal: 16.0,
//              ),
//              decoration: BoxDecoration(
//                color: _currentIndex == key
//                    ? Colors.blue[600]
//                    : Colors.transparent,
//                borderRadius: BorderRadius.circular(20.0),
//              ),
//              child: Icon(value),
//            ),
//          ),
//        ))
//            .values
//            .toList(),
      ),
    );
  }
}
