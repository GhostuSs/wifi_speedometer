import 'package:flutter/material.dart';
import 'package:wifi_speed_test/Data/resultData.dart';
import 'package:wifi_speed_test/presentation/components/history/description/appBarDescription.dart';
import 'package:wifi_speed_test/presentation/components/history/description/descriptionBody.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';

class DescriptionScreen extends StatefulWidget{
  final int index;
  DescriptionScreen(int this.index);
  @override
  State<StatefulWidget> createState() {
    return _DescriptionScreen(index);
  }
}

class _DescriptionScreen extends State<DescriptionScreen>{
  final int index;
  _DescriptionScreen(int this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kDarkGrey,
        appBar: appBarDescription(context,index),
        body: DescriptionBody(index)
    );
  }
}

