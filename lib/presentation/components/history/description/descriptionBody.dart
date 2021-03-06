import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:wifi_speed_test/Data/historyData.dart';
import 'package:wifi_speed_test/presentation/components/history/description/wifiInfoHistory.dart';
import 'package:wifi_speed_test/presentation/components/test/resultRateCard.dart';

class DescriptionBody extends StatelessWidget{
  final int index;
  DescriptionBody(int this.index);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5, right: 5,bottom: height * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ResultsRateCard(
                    Keys.download,
                    context.read<HistoryList>().dataList[index].downloadRate ?? 0
                ),
                ResultsRateCard(
                    Keys.upload,
                    context.read<HistoryList>().dataList[index].uploadRate ?? 0
                ),
              ],
            ),
          ),
          WifiInfoHistoryCard(index),
        ]
    );
  }
}