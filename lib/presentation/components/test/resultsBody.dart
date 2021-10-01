import 'package:flutter/cupertino.dart';
import 'package:provider/src/provider.dart';
import 'package:wifi_speed_test/Data/resultData.dart';
import 'package:wifi_speed_test/presentation/components/test/resultRateCard.dart';
import 'package:wifi_speed_test/presentation/components/test/wifiInfoCard.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';

class ResultBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: height*0.015),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'all finished'.toUpperCase(),
                    style: TextStyle(
                        color: kWhite,
                        fontSize: 18,
                        fontFamily: 'OpenSans-SemiBold',
                        fontWeight: FontWeight.w500
                    )
                )
              ]
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal:height*0.01,vertical: height*0.05 ),
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
          WifiInfoCard()
        ]
    );
  }
}