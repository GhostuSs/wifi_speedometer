import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wifi_speed_test/presentation/components/main/bottomNavigationBar/bottomNavBar.dart';
import 'package:wifi_speed_test/presentation/screens/settings/settingsScreen.dart';
import 'package:wifi_speed_test/presentation/screens/test/speedTest.dart';
import 'package:wifi_speed_test/presentation/screens/test/startScreen.dart';
import 'package:wifi_speed_test/presentation/screens/wifipass/wifiScreen.dart';
import 'constants/colorPallette.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}
class _HomePage extends State<HomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List pages = [
      StartScreen(),
      SpeedTest(),
      WifiScreen(),
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