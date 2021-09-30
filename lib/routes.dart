import 'package:flutter/cupertino.dart';
import 'package:wifi_speed_test/presentation/screens/history/historyScreen.dart';
import 'package:wifi_speed_test/presentation/screens/home.dart';
import 'package:wifi_speed_test/presentation/screens/onboarding/onboardingInternetSpeedTest.dart';
import 'package:wifi_speed_test/presentation/screens/settings/settingsScreen.dart';
import 'package:wifi_speed_test/presentation/screens/test/resultScreen.dart';
import 'package:wifi_speed_test/presentation/screens/test/speedTest.dart';
import 'package:wifi_speed_test/presentation/screens/test/startScreen.dart';
import 'package:wifi_speed_test/presentation/screens/wifipass/wifiScreen.dart';
export 'main.dart';

final Map<String, WidgetBuilder> routes = {
  "/onboarding": (BuildContext context) => OnBoardingScreen(),
  "/": (BuildContext context) => HomePage(),
  "/start": (BuildContext context) => StartScreen(),
  "/speedtest": (BuildContext context) => SpeedTest(),
  "/results" : (BuildContext context) => ResultScreen(),
  "/settings" : (BuildContext context) => SettingsScreen(),
  "/wifipass" : (BuildContext context) => WifiScreen(),
  "/history" : (BuildContext context) => HistoryScreen(),
};