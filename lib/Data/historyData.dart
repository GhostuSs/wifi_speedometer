import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wifi_speed_test/Data/resultData.dart';

class HistoryList{
  late List<Data> dataList;
}
clearList()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
}
saveList(List<Data> gotList) async {
  List list = gotList;
  list = list.map((item) => json.encode(item)).toList();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setStringList('history_key', list as List<String>);
}
Future<List<Data>> getList() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var gotList = prefs.getStringList('history_key');
  if(gotList!=null){
    List<Data> dataSet=List.empty(growable: true);
    for(int i=0;i<gotList.length;i++){
      Data item = Data(dateTime: '',device: '',downloadRate: 0,uploadRate: 0,ip: '',isp: '',wifi: '');
      item = Data.fromJson(json.decode(gotList[i]));
      dataSet.add(item);
    }
    return dataSet;
  }else{
    return [];
  }
}
addList(Data data)async{
  List<Data> list = await getList();
  list.add(data);
  await saveList(list);
}
removeLast() async {
  List<Data> list = await getList();
  list.removeLast();
  await saveList(list);
}
