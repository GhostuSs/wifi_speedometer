import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wifi_speed_test/Data/resultData.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';
import 'package:provider/provider.dart';

class WifiInfoCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: height*0.015),
        child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color:kLightGrey.withOpacity(0.15),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 15,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            fields(CupertinoIcons.globe, 'ISP',context.read<Data>().isp,false),
            fields(CupertinoIcons.wifi, 'Wi-Fi Name', '${context.read<Data>().wifi}',false),
            fields(CupertinoIcons.location_solid, 'IP Address', '${context.read<Data>().ip}',false),
            fields(CupertinoIcons.device_laptop, 'Server','Vitry-sur-Seine, Fr',false),
            fields(Icons.phone_iphone, 'Device', '${context.read<Data>().device}',true),

          ],
        ),
      ),
    )
    );
  }
Widget fields(IconData icon,String nameOfField,value,last){
    double fontSize=20;
    double iconSize=26;
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 3),
            child: Row(
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Icon(
                      icon,
                      color: kLightGrey,
                      size: iconSize,
                    )
                ),//Icon
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      '$nameOfField',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: kLightGrey,
                        fontSize: fontSize,
                        fontFamily: 'OpenSans-Regular',
                        fontWeight: FontWeight.w400,
                      ),
                    )
                ),
                Spacer(),
                Text(
                  value=='null' ? 'Unknown' : '$value',
                  style: TextStyle(
                      color: kWhite,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'OpenSans-Regular',
                      fontSize: fontSize
                  ),
                )
              ],

            ),
          ),
          last
              ? Text('')
              : Divider(
            thickness: 1.0,
            color: kLightGrey,
          )
        ],
      ),
    );
}

}