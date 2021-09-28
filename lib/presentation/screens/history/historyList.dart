import 'package:flutter/material.dart';
import 'package:wifi_speed_test/Data/historyData.dart';
import 'package:wifi_speed_test/presentation/components/history/appBarHistory.dart';
import 'package:wifi_speed_test/presentation/components/history/historyBody.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';

class HistoryScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HistoryScreen();
  }
}

class _HistoryScreen extends State<HistoryScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
        icon: Icon(Icons.add),
        onPressed: () async {
          await loadData();
        },
      ),
        backgroundColor: kDarkGrey,
        appBar: appBarHistory(context),
        body: HistoryBody()
    );
  }
}



