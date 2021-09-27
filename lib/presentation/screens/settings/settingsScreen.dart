import 'package:flutter/material.dart';
import 'package:wifi_speed_test/presentation/components/main/bottomNavigationBar/bottomNavBar.dart';
import 'package:wifi_speed_test/presentation/components/settings/rawCard.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';

class SettingsScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SettingsScreen();
  }
}

class _SettingsScreen extends State<SettingsScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkGrey,
      body: Padding(
        padding: EdgeInsets.only(left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.only(top: 70,bottom: 40),
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Settings',
                  style: TextStyle(
                      color: kWhite,
                      fontSize: 32,
                      fontFamily: 'OpenSans-SemiBold',
                      fontWeight: FontWeight.w600
                  ),
                )
              ],
            )
            ),
            rawCard('Share',(){}),
            rawCard('Privacy policy',(){}),
            rawCard('Terms of use',(){}),
            rawCard('Support',(){}),
          ],
        ),
      ),
    );
  }

}