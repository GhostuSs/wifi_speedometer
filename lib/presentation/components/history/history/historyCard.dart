import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:wifi_speed_test/Data/historyData.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';
import 'package:wifi_speed_test/presentation/screens/history/description.dart';

class HistoryCard extends StatefulWidget{
  final int index;
  HistoryCard(int this.index);
  @override
  State<StatefulWidget> createState() {
    return _HistoryCard(index);
  }
}
class _HistoryCard extends State<HistoryCard>{
  final int index;
  _HistoryCard(int this.index);
  @override
  Widget build(BuildContext context) {
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
            Navigator.push(context, MaterialPageRoute(builder: (context)=>DescriptionScreen(index)));
          },
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    Text(
                      '${context.read<HistoryList>().dataList[index].dateTime}',
                      style: TextStyle(
                          color: kWhite,
                          fontWeight: FontWeight.w400,
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
                          fontSize: 14,
                        fontWeight:FontWeight.w300
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
                          '${context.read<HistoryList>().dataList[index].downloadRate}'.toUpperCase(),
                          style: TextStyle(
                              color: kWhite,
                              fontFamily: 'OpenSans-SemiBold',
                              fontSize: 24,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        '${context.read<HistoryList>().dataList[index].uploadRate}'.toUpperCase(),
                        style: TextStyle(
                            color: kWhite,
                            fontFamily: 'OpenSans-SemiBold',
                            fontWeight: FontWeight.w500,
                            fontSize: 24
                        ),
                      )
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(
                          context.read<HistoryList>().dataList[index].wifi==null ? 'Unknown' : '${context.read<HistoryList>().dataList[index].wifi}',
                          style: TextStyle(
                              color: kWhite,
                              fontFamily: 'OpenSans-SemiBold',
                              fontWeight: FontWeight.w500,
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
                          'Mpbs',
                          style: TextStyle(
                            color: kWhite,
                            fontFamily: 'OpenSans-Regular',
                            fontSize: 14,
                            fontWeight: FontWeight.w300
                          ),
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Mpbs',
                          style: TextStyle(
                            color: kWhite,
                            fontFamily: 'OpenSans-Regular',
                            fontSize: 14,
                              fontWeight: FontWeight.w300
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