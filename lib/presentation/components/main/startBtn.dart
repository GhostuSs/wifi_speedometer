import 'package:flutter/material.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';

class StartButton extends StatelessWidget {
  final double width;
  final double height;
  final onPressed;

  const StartButton({
    this.width = double.infinity,
    this.height = 50.0,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      height: 250.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(125.0)),
          gradient: LinearGradient(
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
            stops: [
              0.25,
              0.5,
              0.75,
            ],
            colors: <Color>[
              Color(0xFF3498CB),
              Color(0xFF55B4D1),
              Color(0xFF80D9D9),
            ],
          ),
          boxShadow: [
        BoxShadow(
          color: kBlue.withOpacity(0.5),
          offset: Offset(0.0, 0.0),
          blurRadius: 30.0,
          spreadRadius: 0.1
        ),
      ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(100.0),
            splashColor: Color(0xFF3498CB),
            highlightColor: kBlack,
            child: Center(
              child: Text('start'.toUpperCase(),
                style: TextStyle(
                  color: kWhite,
                  fontFamily: 'OpenSans-Regular',
                  fontWeight: FontWeight.bold,
                  fontSize: 32.0
                )
              ),
            )),
      ),
    );
  }
}