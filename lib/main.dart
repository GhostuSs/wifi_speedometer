import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wifi_speed_test/presentation/screens/mainScreen.dart';
import 'package:wifi_speed_test/presentation/screens/test/resultScreen.dart';
import 'package:wifi_speed_test/presentation/screens/test/speedTest.dart';
import 'package:wifi_speed_test/presentation/screens/test/startScreen.dart';

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
  "/results" : (BuildContext context) => ResultScreen()
};