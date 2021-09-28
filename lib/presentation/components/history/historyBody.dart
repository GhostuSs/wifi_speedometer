import 'package:flutter/material.dart';
import 'package:wifi_speed_test/Data/historyData.dart';
import 'historyCard.dart';

class HistoryBody extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _HistoryBody();
  }

}
class _HistoryBody extends State<HistoryBody>{
  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final List<Widget> historyResults = List.generate(1, (index) => HistoryCard());
    return ListView.builder(
        itemCount: historyResults.length,
        itemBuilder: (context, index)=>HistoryCard());
  }
  getData() async {
    await loadData(context);
  }
}