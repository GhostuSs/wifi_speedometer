import 'package:flutter/material.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';
enum Keys{
  download,
  upload,
}
class ResultsRateCard extends StatelessWidget{
  ResultsRateCard(Keys this.keyVal,int this.value);
  final keyVal;
  final value;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 185,
        height: 110,
        decoration: BoxDecoration(
          color:kPersonalLightGrey.withOpacity(0.25),
          borderRadius: BorderRadius.circular(10.0),
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                keyVal==Keys.download
                    ? Text(
                    'download: '.toUpperCase(),
                    style: _textStyle()
                )
                    :Text(
                    'upload: '.toUpperCase(),
                    style: _textStyle()
                ),
                Icon(
                  keyVal==Keys.download
                      ? Icons.keyboard_arrow_down_rounded
                      : Icons.keyboard_arrow_up_rounded,
                  size: 40.0,
                  color: kPersonalLightGrey,
                )
              ],
            ),//Download/upload title
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                  '$value',
                style: TextStyle(
                  color: kPersonalWhite,
                  fontFamily: 'OpenSans-SemiBold',
                  fontWeight: FontWeight.w600,
                  fontSize: 36.0
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left:5,bottom: 7),
                  child: Text(
                'Mpbs',
                style: TextStyle(
                    color: kPersonalBlue,
                    fontFamily: 'OpenSans-Regular',
                    fontSize: 18.0
                ),
              )
              ),
            ],
          )
        ],
      ),
    );
  }
TextStyle _textStyle(){
    return TextStyle(
        color: kPersonalLightGrey,
        fontFamily: 'OpenSans-Regular',
        fontSize: 20.0
    );
}
}