import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wifi_speed_test/Data/resultData.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';
import 'package:provider/provider.dart';

class WifiInfoCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final suffix=context.read<Data>();
    return Padding(
        padding: EdgeInsets.only(left: 20,right: 20),
        child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color:kPersonalLightGrey.withOpacity(0.15),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 15,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            fields(CupertinoIcons.globe, 'ISP',suffix.isp,false),
            fields(CupertinoIcons.wifi, 'Wi-Fi Name', '${suffix.wifi}',false),
            fields(CupertinoIcons.location_solid, 'IP Address', '${suffix.ip}',false),
            fields(CupertinoIcons.device_laptop, 'Server','Vitry-sur-Seine, Fr',false),
            fields(Icons.phone_iphone, 'Device', '${suffix.device}',true),

          ],
        ),
      ),
    )
    );
  }
Widget fields(IconData icon,String nameOfField,value,last){
    double fontSize=24;
    double iconSize=28;
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                      padding: EdgeInsets.only(bottom: 1),
                      child: Icon(
                        icon,
                        color: kPersonalLightGrey,
                        size: iconSize,
                      )
                  ),//Icon
                  Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          '$nameOfField',
                          style: TextStyle(
                            color: kPersonalLightGrey,
                            fontSize: fontSize,
                            fontFamily: 'OpenSans-Regular',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      )
                  ),
                  Spacer(),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      '$value',
                      style: TextStyle(
                          color: kPersonalWhite,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'OpenSans-Regular',
                          fontSize: fontSize
                      ),
                    ),
                  ),
                ],

              )
          ),
          last
              ? Text('')
              : Divider(
            thickness: 1.0,
            color: kPersonalLightGrey,
          )
        ],
      ),
    );
}

}