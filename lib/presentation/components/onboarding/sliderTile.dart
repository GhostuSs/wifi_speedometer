import 'package:flutter/material.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';

class SliderTile extends StatelessWidget{
  final imageAssetPath,title,desc;
  var quitEnabled;
  SliderTile(
      {
        required this.imageAssetPath,
        required this.title,
        required this.desc,
      }
      );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imageAssetPath,
              filterQuality: FilterQuality.high
            ),
            Text(
              title,
              textAlign: TextAlign.justify,
              maxLines: 2,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                  fontFamily: 'OpenSans-SemiBold',
                  color: kPersonalWhite
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
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        fontFamily: 'OpenSans-SemiBold',
                        color: kPersonalWhite
                    )
                )),
            SizedBox(height: MediaQuery.of(context).size.height*0.2)
          ],
        ),
      ),
    );
  }
}