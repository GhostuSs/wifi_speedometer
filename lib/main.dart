import 'package:flutter/material.dart';
import 'package:wifi_speed_test/presentation/screens/mainScreen.dart';

void main() => runApp(MaterialApp(initialRoute: '/main', routes: {
      "/main": (BuildContext context) => MainScreen(),
    }));
