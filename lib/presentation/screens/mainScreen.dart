import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wifi_speed_test/presentation/components/bottomNavBar.dart';
import 'package:wifi_speed_test/presentation/screens/test/testScreen.dart';

import '../constants.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreen();
  }
}

class _MainScreen extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPersonalBlue,
      bottomNavigationBar: btmNavBar(_selectedIndex, _onItemTapped),
      body: _routes[_selectedIndex],
    );
  }

  final List _routes = [
    TestScreen(),
    Text('Soon'),
    Text('Soon'),
    Text('Soon'),
  ];

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
