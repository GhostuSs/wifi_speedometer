import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';

class RateMyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: CupertinoAlertDialog(
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Image.asset('assets/onboarding/appIcon.png',
                  filterQuality: FilterQuality.high),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 5),
              child: Text(
                'Please rate the app',
                style: TextStyle(
                    fontFamily: 'OpenSans-Bold',
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: kWhite),
              ),
            ),
          ],
        ),
        content: Text(
          'Tap a star to rate it on the App Store.\nWe will be very grateful to you',
          textAlign: TextAlign.center,
          overflow: TextOverflow.fade,
          style: TextStyle(
              fontFamily: 'OpenSans-Regular',
              fontSize: 13,
              color: kWhite),
        ),
        actions: [
          CupertinoDialogAction(
              child: RatingBarIndicator(
                rating: 5.0,
                itemCount: 5,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, _) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.5),
                    child: Icon(
                      Icons.star_rate_sharp,
                      size: 30.0,
                      color: kBlue,
                    )),
              )),
          CupertinoDialogAction(
              isDefaultAction: true,
              child: TextButton(
                child: Text(
                  'Not Now',
                  style: TextStyle(
                      color: kBlue,
                      fontSize: 17.0,
                      fontFamily: 'OpenSans-Bold',
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ))
        ],
      )
    );
  }
}
