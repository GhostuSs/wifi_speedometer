import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wifi_speed_test/Data/historyData.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';
import 'historyCard.dart';

class HistoryBody extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _HistoryBody();
  }
}

class _HistoryBody extends State<HistoryBody>{
  late List<Widget> historyList;
  late SharedPreferences sharedPreferences;
  Future<bool> initSharedPreferences(BuildContext context)async{
    sharedPreferences = await SharedPreferences.getInstance();
    context.read<HistoryList>().dataList=await getList();
    historyList = List.generate(context.read<HistoryList>().dataList.length, (index) => HistoryCard(index));
    return true;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
            future: initSharedPreferences(context), builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(
                color: kBlue,
              ),
            );
          }else{
            return ListView.builder(
                itemCount: historyList.length,
                itemBuilder: (context, index) => HistoryCard(index));
          }
        }
        )
    );
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
    }else{
      print('no data');
    }
  }
}

