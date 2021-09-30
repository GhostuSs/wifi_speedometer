import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';

class SliderTile extends StatelessWidget{
  final imageAssetPath,title,desc;
  final bool flag;
  SliderTile(
      {
        required this.imageAssetPath,
        required this.title,
        required this.desc,
        required this.flag
      }
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
        children:[
          Align(
            alignment: Alignment.topLeft,
            child: flag
                ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 60),
              child: IconButton(
                onPressed: () {Navigator.pushNamed(context, '/');},
                icon: Icon(CupertinoIcons.clear),
                splashColor: kDarkGrey,
                hoverColor: kDarkGrey,
                highlightColor: kDarkGrey,
                splashRadius: 0.5,
                color: kWhite,
                iconSize: 28.0,
              ),
            )
                : Text('')
          ),
          Center(
      child: Container(
        color: kDarkGrey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imageAssetPath,
              filterQuality: FilterQuality.none
            ),
            Text(
              title,
              textAlign: TextAlign.justify,
              maxLines: 2,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                  fontFamily: 'OpenSans-SemiBold',
                  color: kWhite
              ),
            ),
            SizedBox(height: 12),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                    desc,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        fontFamily: 'OpenSans-SemiBold',
                        color: kWhite
                    )
                )),
            SizedBox(height: MediaQuery.of(context).size.height*0.2)
          ],
        ),
      ),
    )
        ]
    );
  }
}