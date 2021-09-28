import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:wifi_speed_test/Data/resultData.dart';
import 'package:wifi_speed_test/presentation/components/test/resultRateCard.dart';
import 'package:wifi_speed_test/presentation/components/test/wifiInfoCard.dart';

class DescriptionBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
        children: [
          SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.all(height*0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ResultsRateCard(
                    Keys.download,
                    context.read<Data>().downloadRate ?? 0
                ),
                ResultsRateCard(
                    Keys.upload,
                    context.read<Data>().uploadRate ?? 0
                ),
              ],
            ),
          ),
          WifiInfoCard(),
        ]
    );
  }
}