import 'package:flutter/cupertino.dart';
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
    return Padding(
      padding: EdgeInsets.only(left: keyVal == Keys.download ? 10 : 0, right:keyVal == Keys.upload ? 10 : 0,bottom:5,top:5),
      child: Container(
        width: width*0.45,
          decoration: BoxDecoration(
            color:kLightGrey.withOpacity(0.15),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      keyVal==Keys.download
                          ? Text(
                          'download:'.toUpperCase(),
                          style: _textStyle()
                      )
                          : Text(
                          '  upload:'.toUpperCase(),
                          style: _textStyle()
                      ),
                      Icon(
                        keyVal==Keys.download
                            ? CupertinoIcons.chevron_down
                            : CupertinoIcons.chevron_up,
                        size: 24.0,
                        color: kLightGrey,
                      )
                    ],
                  ),//Download/upload title
                )),
                SizedBox(height: height*0.01),
                Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '$value',
                          style: TextStyle(
                              color: kWhite,
                              fontFamily: 'OpenSans-SemiBold',
                              fontWeight: FontWeight.w600,
                              fontSize: 24.0
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left:5,bottom: 2),
                            child: Text(
                              'Mpbs',
                              style: TextStyle(
                                  color: kBlue,
                                  fontFamily: 'OpenSans-Regular',
                                  fontSize: 14.0
                              ),
                            )
                        ),
                      ],
                    )
                ),
                SizedBox(height: height*0.0225)
              ],
            ),
          )
      ),
    );
  }
TextStyle _textStyle(){
    return TextStyle(
        color: kLightGrey,
        fontFamily: 'OpenSans-Regular',
        fontSize: 16.0,
        fontWeight: FontWeight.w300
    );
}
}