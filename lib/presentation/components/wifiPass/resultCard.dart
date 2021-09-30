import 'package:flutter/cupertino.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';

enum CardState{
  card,
  label
}

class ResultCard extends StatelessWidget {
  final isUnique;
  final passwordPosition;
  final CardState state;
  ResultCard({required this.isUnique, this.passwordPosition,required this.state});
  @override
  Widget build(BuildContext context) {
    Widget result;
    CardState.card == state ? result=Padding(
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
                fontWeight: FontWeight.w500,
                color: kWhite
            ),
          ),
        ),
      ),
    ) : result = Row(
      children: [
        Text(
          ' Find how often your Wi-Fi password is used',
          style: TextStyle(
              color: kWhite,
              fontFamily: 'OpenSans-Regular',
              fontSize: 14
          ),
        ),
      ],
    );
    return result;
  }
}