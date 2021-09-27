import 'package:flutter/material.dart';
import 'historyCard.dart';

class HistoryBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final List<Widget> historyResults = List.generate(0, (index) => HistoryCard(index: index));
    return ListView.builder(
        itemCount: historyResults.length,
        itemBuilder: (context, index)=>HistoryCard(index: 1));
  }
}