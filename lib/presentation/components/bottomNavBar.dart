import 'package:flutter/material.dart';

import '../constants.dart';

Widget btmNavBar(int selectedIndex, callback) {
  return SizedBox(
    height: 100,
    child: BottomNavigationBar(
      currentIndex: selectedIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: kPersonalBlack,
      selectedItemColor: kPersonalBlue,
      unselectedItemColor: kPersonalGrey,
      onTap: callback,
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
    ),
  );
}
