import 'package:flutter/material.dart';

import 'historyCard.dart';

class HistoryBody extends StatelessWidget{
  final List<Widget> historyResults = List.generate(1, (index) => HistoryCard(index: index));
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: historyResults.length,
        itemBuilder: (context, index)=>HistoryCard(index: 1));
  }
}