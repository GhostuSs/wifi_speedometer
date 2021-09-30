import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';
import 'package:wifi_speed_test/routes.dart';
import 'Data/resultData.dart';
import 'Data/historyData.dart';

bool seen=false;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  seen = prefs.getBool("seen") ?? false;
  print(seen.toString());
  await prefs.setBool("seen", true);
  seen = false;
  runApp(
    MultiProvider(
      providers: [
        Provider<Data>(create: (_) => Data()),
        Provider<HistoryList>(create: (_) => HistoryList()),
      ],
      child: MaterialApp(
        color: kDarkGrey,
          darkTheme: ThemeData.dark(),
          debugShowCheckedModeBanner: false,
          initialRoute: seen ? '/' : "/onboarding" ,
          routes: routes
      ),
    )
);
}

