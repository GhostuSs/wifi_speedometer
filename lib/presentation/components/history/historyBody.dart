import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wifi_speed_test/Data/historyData.dart';
import 'package:wifi_speed_test/Data/resultData.dart';
import 'historyCard.dart';

class HistoryBody extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _HistoryBody();
  }

}
class _HistoryBody extends State<HistoryBody>{
  List<Data> dataList =List.empty(growable: true);
  late SharedPreferences sharedPreferences;

  @override
  void initState(){
    initSharedPreferences();
    super.initState();
  }
  initSharedPreferences()async{
    sharedPreferences = await SharedPreferences.getInstance();
    await getList(dataList);
  }
  @override
  Widget build(BuildContext context) {

    final List<Widget> historyList = List.generate(dataList.length, (index) => HistoryCard(dataList[index]));
    return ListView.builder(
        itemCount: historyList.length,
        itemBuilder: (context, index)=>HistoryCard(dataList[index]));
  }
  saveData(){
    List<dynamic> list =List.empty(growable: true);
    list = list.map((item) => json.encode(item.toMap())).toList();
    sharedPreferences.setStringList('history_key', list as List<String>);
    print(list);
  }
  loadData(){
    List<String>? list = sharedPreferences.getStringList('history_key');
    if(list != null){
      var listData = list.map((item) => Data.fromJson(json.decode(item))).toList();
    }else{
      print('no data');
    }
  }
}