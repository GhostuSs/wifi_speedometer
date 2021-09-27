import 'package:flutter/material.dart';
import 'package:wifi_speed_test/presentation/components/history/appBarHistory.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HistoryScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ResultScreen();
  }
}

class _ResultScreen extends State<HistoryScreen>{
  @override
  Future<void> initState() async {
    super.initState();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kDarkGrey,
        appBar: appBarHistory(context),
        body: HistoryBody()
    );
  }
}

class HistoryBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Text('123',style: TextStyle(color: kWhite),)
        ]
    );
  }
}