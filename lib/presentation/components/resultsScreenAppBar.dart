import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';

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
          icon: Icon(
            CupertinoIcons.delete,
            size: 28.0,
          )
      )
    ],
  );
}