import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../screens/constants/colorPallette.dart';

CupertinoTabBar btmNavBar(int selectedIndex) {
  return CupertinoTabBar(
      backgroundColor: kPersonalBlack,
      activeColor: kPersonalBlue,
      inactiveColor: kPersonalLightGrey,
      currentIndex: selectedIndex,
      items: [
        BottomNavigationBarItem(
            icon: Image.asset('assets/tab_test.png'),
            label: 'Test',
            activeIcon: Image.asset(
              'assets/tab_test.png',
              color: kPersonalBlue,
            )),
        BottomNavigationBarItem(
            icon: Image.asset('assets/tab_history.png'),
            label: 'History',
            activeIcon: Image.asset(
              'assets/tab_history.png',
              color: kPersonalBlue,
            )),
        BottomNavigationBarItem(
            icon: Image.asset('assets/tab_pass.png'),
            label: 'Pass',
            activeIcon: Image.asset(
              'assets/tab_pass.png',
              color: kPersonalBlue,
            )),
        BottomNavigationBarItem(
            icon: Image.asset('assets/tab_settings.png'),
            label: 'Settings',
            activeIcon: Image.asset(
              'assets/tab_settings.png',
              color: kPersonalBlue,
            )),
      ],
  );
}