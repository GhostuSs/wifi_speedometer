import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:wifi_speed_test/Data/historyData.dart';
import 'package:wifi_speed_test/Data/resultData.dart';
import 'package:wifi_speed_test/presentation/components/test/resultsBody.dart';
import 'package:wifi_speed_test/presentation/components/test/resultsScreenAppBar.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';

class ResultScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ResultScreen();
  }
}

class _ResultScreen extends State<ResultScreen>{
  @override
  void initState() {
    DateTime dateTime = DateTime.now();
    String currentDateTime='${dateTime.day}.'+(dateTime.month<DateTime.october?'0':'')+'${dateTime.month}.${dateTime.year}, ${dateTime.hour}:'+(dateTime.minute<10?'0':'')+'${dateTime.minute}';
    context.read<Data>().dateTime=currentDateTime;
    addThis();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kDarkGrey,
      appBar: appBarResults(context),
      body: ResultBody()
    );
  }
  addThis() async {
    await addList(context.read<Data>());
  }
}

