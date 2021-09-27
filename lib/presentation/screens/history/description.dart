import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:wifi_speed_test/Data/resultData.dart';
import 'package:wifi_speed_test/presentation/components/history/appBarDescription.dart';
import 'package:wifi_speed_test/presentation/components/test/resultRateCard.dart';
import 'package:wifi_speed_test/presentation/components/test/wifiInfoCard.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';

class DescriptionScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _DescriptionScreen();
  }
}

class _DescriptionScreen extends State<DescriptionScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kDarkGrey,
        appBar: appBarDescription(context),
        body: DescriptionBody()
    );
  }
}

class DescriptionBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          SizedBox(height: 15),
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
    );
  }
}