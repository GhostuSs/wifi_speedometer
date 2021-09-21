import 'package:flutter/material.dart';
import 'package:wifi_speed_test/presentation/components/resultCards.dart';
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
                ResultsCard(Keys.download,75),
                ResultsCard(Keys.upload,85),
              ],
            ),
          ),
        ]
    )
    );
  }
  PreferredSizeWidget appBar(){
    return AppBar(
      elevation: 0.0,
      toolbarHeight: 80,
      backgroundColor: kPersonalDarkGrey,
      leading: IconButton(
        onPressed: () {  },
        icon: Icon(Icons.arrow_back_ios),
        color: kPersonalWhite,
        iconSize: 28.0,
      ),
      title: Text(
        'Result',
        style: TextStyle(
            color: kPersonalWhite,
            fontSize: 28.0,
            fontWeight: FontWeight.w600
        ),
      ),
      actions: [
        IconButton(
            onPressed: (){},
            icon: Image.asset(
              'assets/trash.png',
              height: 28.0,
            )
        )
      ],
    );
  }
}