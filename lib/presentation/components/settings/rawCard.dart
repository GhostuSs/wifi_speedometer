import 'package:flutter/material.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';

Widget rawCard(String text,onPressed){
  return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0),
        splashColor: kBlack,
        highlightColor: kBlack,
        child: Container(
          width: double.infinity,
          height: 65,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kLightGrey.withOpacity(0.15)
          ),
          child: Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                      '$text',
                      style: TextStyle(
                          color: kWhite,
                          fontWeight: FontWeight.w600,
                          fontSize: 21.0,
                          fontFamily: 'OpenSans-SemiBold'
                      )
                  )
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: Icon(
                    Icons.arrow_forward_ios,
                    color: kWhite,
                  )
              )
            ],
          ),
        ),
        onTap: onPressed,
      )
  );
}