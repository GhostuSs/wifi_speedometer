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
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        width: MediaQuery.of(context).size.width*0.44,
        height: MediaQuery.of(context).size.height*0.12,
        decoration: BoxDecoration(
          color:kPersonalLightGrey.withOpacity(0.25),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: width*0.03,right: width*0.025,bottom: height*0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    keyVal==Keys.download
                        ? FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                          'download:'.toUpperCase(),
                          style: _textStyle()
                      ),
                    )
                        : FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                            'upload:'.toUpperCase(),
                            style: _textStyle()
                        )
                    ),
                    Icon(
                      keyVal==Keys.download
                          ? Icons.keyboard_arrow_down_rounded
                          : Icons.keyboard_arrow_up_rounded,
                      size: 38.0,
                      color: kPersonalLightGrey,
                    )
                  ],
                ),//Download/upload title
              )),
              Center(child:Row(
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
              ))
            ],
          ),
        ),
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