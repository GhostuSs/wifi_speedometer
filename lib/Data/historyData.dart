import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wifi_speed_test/Data/resultData.dart';

loadData(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? json = prefs.getString('testData_key') ?? null;
  if(json==null){
    print('no data');
  }else{
    Map<String,dynamic> map = jsonDecode(json);
    print(map);
    context.read<Data>().fromJson(map);
  }
}
saveData(Data data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String json = jsonEncode(data);
  print('gen json:$json');
  prefs.setString('testData_key', json);
}
clearData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
  print('Data cleared');
}