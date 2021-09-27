
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:wifi_speed_test/Data/resultData.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';
import 'package:wifi_speed_test/presentation/screens/history/description.dart';
class HistoryCard extends StatefulWidget{
  final index;
  HistoryCard({required int this.index});
  @override
  State<StatefulWidget> createState() {
    return _HistoryCard();
  }
}
class _HistoryCard extends State<HistoryCard>{
  DateTime dateTime =DateTime.now();
  @override
  Widget build(BuildContext context) {;
  return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kLightGrey.withOpacity(0.15)
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          splashColor: kBlack,
          hoverColor: kBlack,
          highlightColor: kBlack,
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>DescriptionScreen()));
          },
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    Text(
                      '${context.read<Data>().dateTime}',
                      style: TextStyle(
                          color: kWhite,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'OpenSans-SemiBold',
                          fontSize: 18
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10,bottom: 5,left: 20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'download:'.toUpperCase(),
                      style: TextStyle(
                          color: kWhite,
                          fontFamily: 'OpenSans-Regular',
                          fontSize: 14
                      ),
                    ),
                    Text(
                      'upload:'.toUpperCase(),
                      style: TextStyle(
                          color: kWhite,
                          fontFamily: 'OpenSans-Regular',
                          fontSize: 14
                      ),
                    ),
                    Text(
                      'Wi-Fi Name:',
                      style: TextStyle(
                          color: kWhite,
                          fontFamily: 'OpenSans-Regular',
                          fontSize: 14
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Text(
                          '${context.read<Data>().downloadRate}'.toUpperCase(),
                          style: TextStyle(
                              color: kWhite,
                              fontFamily: 'OpenSans-SemiBold',
                              fontSize: 24,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        '${context.read<Data>().uploadRate}'.toUpperCase(),
                        style: TextStyle(
                            color: kWhite,
                            fontFamily: 'OpenSans-SemiBold',
                            fontWeight: FontWeight.w600,
                            fontSize: 24
                        ),
                      )
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(
                          '${context.read<Data>().wifi}',
                          style: TextStyle(
                              color: kWhite,
                              fontFamily: 'OpenSans-SemiBold',
                              fontWeight: FontWeight.w600,
                              fontSize: 14
                          ),
                        ),
                      )
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom:20 ,left: 20,right: 20),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Text(
                          'Mbps',
                          style: TextStyle(
                            color: kWhite,
                            fontFamily: 'OpenSans-Regular',
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Mbps',
                          style: TextStyle(
                            color: kWhite,
                            fontFamily: 'OpenSans-Regular',
                            fontSize: 14,
                          ),
                        )
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
  );
  }

}