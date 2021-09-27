import 'package:flutter/material.dart';
import 'package:wifi_speed_test/presentation/components/history/appBarDescription.dart';
import 'package:wifi_speed_test/presentation/components/history/descriptionBody.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';

class DescriptionScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _DescriptionScreen();
  }
}

class _DescriptionScreen extends State<DescriptionScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kDarkGrey,
        appBar: appBarDescription(context),
        body: DescriptionBody()
    );
  }
}

