

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';

enum BtnState{
  notReady,
  ready
}

class Button extends StatelessWidget{
  final BtnState state;
  final onPressed;
  Button(BtnState this.state,this.onPressed);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color:BtnState.ready==state ? kBlue : kLightGrey.withOpacity(0.15)
        ),
        child: TextButton(
            onPressed:onPressed,
            child: Text(
              'Find out'.toUpperCase(),
              style: TextStyle(
                  color: kWhite,
                  fontSize: 18.0,
                  fontFamily: 'OpenSans-Regular',
                  fontWeight: FontWeight.bold
              ),
            )
        )
    );
  }

}