import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';


CupertinoTabBar btmNavBar(int selectedIndex) {
  return CupertinoTabBar(
    backgroundColor: kBlack,
    activeColor: kBlue,
    inactiveColor: kLightGrey,
    currentIndex: selectedIndex,
    items: [
      BottomNavigationBarItem(
          icon: Image.asset('assets/icons/test.png'),
          label: 'Test',
          activeIcon: Image.asset(
            'assets/icons/test.png',
            filterQuality: FilterQuality.high,
            color: kBlue,
          )
      ),
      BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/tab_history.png',
            filterQuality: FilterQuality.high),
          label: 'History',
          activeIcon: Image.asset(
            'assets/icons/tab_history.png',
            color: kBlue,
          )),
      BottomNavigationBarItem(
          icon: Image.asset(
              'assets/icons/tab_pass.png',
            filterQuality: FilterQuality.high,
          ),
          label: 'Pass',
          activeIcon: Image.asset(
            'assets/icons/tab_pass.png',
            color: kBlue,
          )),
      BottomNavigationBarItem(
          icon: Image.asset(
              'assets/icons/tab_settings.png',
            filterQuality: FilterQuality.high,
          ),
          label: 'Settings',
          activeIcon: Image.asset(
            'assets/icons/tab_settings.png',
            color: kBlue,
          )),
    ],
  );
}