import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wifi_speed_test/Data/resultData.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';
import 'package:provider/provider.dart';

class WifiInfoCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return AspectRatio(
      aspectRatio: 19/15,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal:height*0.015),
          child: Container(
            decoration: BoxDecoration(
              color:kLightGrey.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
                padding: EdgeInsets.only(left: 15,right: 20),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
                      fields(CupertinoIcons.globe, 'ISP',context.read<Data>().isp,false,context),
                      fields(CupertinoIcons.wifi, 'Wi-Fi Name', '${context.read<Data>().wifi}',false,context),
                      fields(CupertinoIcons.location_solid, 'IP Address', '${context.read<Data>().ip}',false,context),
                      fields(CupertinoIcons.device_laptop, 'Server','Vitry-sur-Seine, Fr',false,context),
                      fields(Icons.phone_iphone, 'Device', '${context.read<Data>().device}',true,context),
                    ],
                  ),
                )
            ),
          )
      ),
    );
  }
Widget fields(IconData icon,String nameOfField,value,last,context){//24
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(
                  icon,
                  color: kLightGrey,
                  size:24
              ),//Icon
              Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    '$nameOfField',
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                        color: kLightGrey,
                        fontFamily: 'OpenSans-Regular',
                        fontWeight: FontWeight.w400,
                        fontSize: 18
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
                    fontSize: 18
                ),
              )
            ],

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