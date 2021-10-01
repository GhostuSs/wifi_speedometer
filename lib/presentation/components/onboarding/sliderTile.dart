import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';

class SliderTile extends StatelessWidget {
  final imageAssetPath, title, desc;
  final bool flag;
  SliderTile(
      {required this.imageAssetPath,
      required this.title,
      required this.desc,
      required this.flag});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Align(
          alignment: Alignment.topLeft,
          child: flag
              ? Padding(
            padding: EdgeInsets.only(
                left: 15, top: MediaQuery.of(context).size.height * 0.02),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              icon: Icon(CupertinoIcons.clear),
              splashColor: kDarkGrey,
              hoverColor: kDarkGrey,
              highlightColor: kDarkGrey,
              splashRadius: 0.5,
              color: kWhite,
              iconSize: 28.0,
            ),
          )
              : Text('')),
      Center(
        child: Container(
          color: kDarkGrey,
          child: Column(
            children: [
              SizedBox(height: 12),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 19/9,
                  child: Image.asset(imageAssetPath,
                      filterQuality: FilterQuality.high),
                ),
              ),
              Text(
                title,
                textAlign: TextAlign.justify,
                maxLines: 2,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    fontFamily: 'OpenSans-SemiBold',
                    color: kWhite),
              ),
              SizedBox(height: 12),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*0.014),
                  child: Text(desc,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          fontFamily: 'OpenSans-SemiBold',
                          color: kWhite))),
              SizedBox(height: MediaQuery.of(context).size.height * 0.3)
            ],
          ),
        ),
      ),
    ]);
  }
}
