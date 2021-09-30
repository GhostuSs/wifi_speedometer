import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wifi_speed_test/presentation/components/main/bottomNavigationBar/bottomNavBar.dart';
import 'package:wifi_speed_test/presentation/screens/settings/settingsScreen.dart';
import 'package:wifi_speed_test/presentation/screens/test/startScreen.dart';
import 'package:wifi_speed_test/presentation/screens/wifipass/wifiScreen.dart';
import 'constants/colorPallette.dart';
import 'history/historyList.dart';

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
    return CupertinoTabScaffold(
      backgroundColor: kBlue,
      tabBar: btmNavBar(_selectedIndex),
      tabBuilder: (BuildContext context, _selectedIndex){
        List pages = [
          StartScreen(),
          HistoryScreen(),
          WifiScreen(),
          SettingsScreen()
        ];
        return CupertinoTabView(
          builder:(context){
            return pages[_selectedIndex];
          } ,
        );
      },
    );
  }
}