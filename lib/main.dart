import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wifi_speed_test/presentation/components/bottomNavBar.dart';
import 'package:wifi_speed_test/presentation/screens/mainScreen.dart';
import 'package:wifi_speed_test/presentation/screens/test/speedTest.dart';
import 'package:wifi_speed_test/presentation/screens/test/startScreen.dart';
int s=1;
void main() => runApp(
    MaterialApp(
      initialRoute: "/",
        routes: _routes
        ),
);

final _routes = {
  "/": (BuildContext context) => MainScreen(),
  "/start": (BuildContext context) => StartScreen(),
  "/speedtest": (BuildContext context) => SpeedTest(),
};