import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:wifi_speed_test/Data/resultData.dart';
import 'package:wifi_speed_test/presentation/components/resultRateCard.dart';
import 'package:wifi_speed_test/presentation/components/resultsScreenAppBar.dart';
import 'package:wifi_speed_test/presentation/components/wifiInfoCard.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';

class ResultScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ResultScreen();
  }
}

class _ResultScreen extends State<ResultScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPersonalDarkGrey,
      appBar: appBar(),
      body: Column(
        children: [
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'all finished'.toUpperCase(),
                style: TextStyle(
                    color: kPersonalWhite,
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                )
          )
    ]
      ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ResultsRateCard(
                    Keys.download,
                    context.read<Data>().downloadRate
                ),
                ResultsRateCard(
                    Keys.upload,
                    context.read<Data>().uploadRate
                ),
              ],
            ),
          ),
          WifiInfoCard(),
        ]
    )
    );
  }

}