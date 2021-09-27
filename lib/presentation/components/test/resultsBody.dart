import 'package:flutter/cupertino.dart';
import 'package:provider/src/provider.dart';
import 'package:wifi_speed_test/Data/resultData.dart';
import 'package:wifi_speed_test/presentation/components/test/resultRateCard.dart';
import 'package:wifi_speed_test/presentation/components/test/wifiInfoCard.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';

class ResultBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          SizedBox(height: 15),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'all finished'.toUpperCase(),
                    style: TextStyle(
                        color: kWhite,
                        fontSize: 18,
                        fontFamily: 'OpenSans-SemiBold',
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
    );
  }
}