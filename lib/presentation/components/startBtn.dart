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
      width: 200.0,
      height: 200.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100.0)),
          gradient: LinearGradient(
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
            colors: <Color>[
              Color(0xFF3498CB),
              Color(0xFF55B4D1),
              Color(0xFF80D9D9),
            ],
          ),
          boxShadow: [
        BoxShadow(
          color: kPersonalBlue.withOpacity(0.4),
          offset: Offset(0.0, 0.0),
          blurRadius: 20.0,
          spreadRadius: 1.5
        ),
      ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(100.0),
            splashColor: Color(0xFF3498CB),
            highlightColor: kPersonalBlack,
            child: Center(
              child: Text('start'.toUpperCase(),
                style: TextStyle(
                  color: kPersonalWhite,
                  fontWeight: FontWeight.w600,
                  fontSize: 32.0
                )
              ),
            )),
      ),
    );
  }
}