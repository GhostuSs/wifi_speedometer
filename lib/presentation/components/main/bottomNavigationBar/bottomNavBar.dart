import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';


CupertinoTabBar btmNavBar(int selectedIndex) {
  return CupertinoTabBar(
    backgroundColor: Color(0xFF161616),
    activeColor: kBlue,
    inactiveColor: kLightGrey,
    currentIndex: selectedIndex,
    border: Border(top: BorderSide(width: 10.0,color: Color(0xFF161616))),
    items: [
      BottomNavigationBarItem(
          icon: Icon(Icons.speed,color: kLightGrey,size: 30),
          label: 'Test',
          activeIcon: Icon(Icons.speed,color: kBlue,size: 30)
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.restore_rounded,color: kLightGrey,size: 30),
          label: 'History',
          activeIcon: Icon(Icons.restore_rounded,color: kBlue,size: 30)),
      BottomNavigationBarItem(
          icon: Icon(Icons.lock_outlined,color: kLightGrey,size: 30),
          label: 'Pass',
          activeIcon: Icon(Icons.lock_outlined,color: kBlue,size: 30)),
      BottomNavigationBarItem(
          icon: Icon(Icons.settings,color: kLightGrey,size: 29),
          label: 'Settings',
          activeIcon: Icon(Icons.settings,color: kBlue,size: 29)),
    ],
  );
}