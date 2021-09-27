import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:wifi_speed_test/Data/resultData.dart';
import 'package:wifi_speed_test/presentation/components/history/appBarHistory.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';

class HistoryScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HistoryScreen();
  }
}

class _HistoryScreen extends State<HistoryScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kDarkGrey,
        appBar: appBarHistory(context),
        body: HistoryBody()
    );
  }
}

class HistoryBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index)=>HistoryCard());
  }
}

class HistoryCard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HistoryCard();
  }
}

class _HistoryCard extends State<HistoryCard>{
  DateTime dateTime =DateTime.now();
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Text(
                      '25'.toUpperCase(),
                      style: TextStyle(
                          color: kWhite,
                          fontFamily: 'OpenSans-SemiBold',
                          fontSize: 24,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      '9'.toUpperCase(),
                      style: TextStyle(
                          color: kWhite,
                          fontFamily: 'OpenSans-SemiBold',
                          fontWeight: FontWeight.w600,
                          fontSize: 24
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20,bottom: 15),
                    child: Text(
                      'Denis',
                      style: TextStyle(
                          color: kWhite,
                          fontFamily: 'OpenSans-SemiBold',
                          fontWeight: FontWeight.w600,
                          fontSize: 14
                      ),
                    ),
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
    );
  }

}