import 'package:flutter/cupertino.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';

class ResultCard extends StatelessWidget {
  final isUnique;
  final passwordPosition;
  ResultCard({required this.isUnique, this.passwordPosition});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Container(
          width: double.infinity,
          height: 57,
          decoration: BoxDecoration(
              color: isUnique&&passwordPosition!=-1
                  ? Color(0xFFFF453A)
                  : Color(0xFF32D74B),
              borderRadius: BorderRadius.circular(10)
          ),
          child: Center(
            child: Text(
              isUnique && passwordPosition!=-1
                  ? 'Your password is the $passwordPosition-th by the \nnumber of uses'
                  :'Your password is unique!',
              overflow: TextOverflow.fade,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'OpenSans-Regualar',
                  fontWeight: FontWeight.w600,
                  color: kWhite
              ),
            ),
          ),
        ),
      ),
    );
  }
}