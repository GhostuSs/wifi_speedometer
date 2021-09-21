import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wifi_speed_test/presentation/components/main/bottomNavBar.dart';
import 'package:wifi_speed_test/presentation/screens/settings/settingsScreen.dart';
import 'package:wifi_speed_test/presentation/screens/test/startScreen.dart';
import 'constants/colorPallette.dart';

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
    List pages = [
      StartScreen(),
      StartScreen(),
      StartScreen(),
      SettingsScreen()
    ];
    return CupertinoTabScaffold(
          backgroundColor: kPersonalBlue,
          tabBar: btmNavBar(_selectedIndex),
        tabBuilder: (BuildContext context, _selectedIndex) {
            return pages.elementAt(_selectedIndex);
        },
    );
  }
}
