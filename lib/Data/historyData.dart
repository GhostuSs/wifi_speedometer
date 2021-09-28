import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wifi_speed_test/Data/resultData.dart';

loadData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? json = prefs.getString('testData_key') ?? null;
  if(json==null){
    print('no data');
  }else{
    print('loaded: $json');
    Map<String,dynamic> map = jsonDecode(json);
    print(map);
    final data = Data.fromJson(map);
    print('${data.dateTime},${data.downloadRate},${data.uploadRate},${data.isp},${data.ip},${data.wifi},${data.device}');
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