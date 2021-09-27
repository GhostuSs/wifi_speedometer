import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:wifi_speed_test/Data/resultData.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';

PreferredSizeWidget appBar(BuildContext context) {
  return AppBar(
    elevation: 0.0,
    toolbarHeight: 80,
    backgroundColor: kDarkGrey,
    leading: Padding(
      padding: EdgeInsets.only(left: 10),
      child: IconButton(
        highlightColor: kDarkGrey,
        splashColor: kDarkGrey,
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
        icon: Icon(Icons.arrow_back_ios),
        color: kWhite,
        iconSize: 28.0,
      ),
    ),
    title: Text(
      'Result',
      style: TextStyle(
          color: kWhite,
          fontSize: 28.0,
          fontFamily: 'OpenSans-SemiBold',
          fontWeight: FontWeight.w600),
    ),
    actions: [
      IconButton(
          highlightColor: kDarkGrey,
          splashColor: kDarkGrey,
          onPressed: () {
            showCupertinoDialog(
                barrierDismissible: true,
                context: context,
                builder: (context) => Theme(
                  child: CupertinoAlertDialog(
                  title: Text(
                    "Delete result?",
                    style: TextStyle(
                        fontFamily: 'OpenSans-SemiBold',
                        color: kWhite),
                  ),
                  content: Text(
                    "Are you sure you want to delete this result?",
                    style: TextStyle(
                        color: kWhite,
                        fontFamily: 'OpenSans-Regular'),
                  ),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      child: Text(
                        "No",
                        style: TextStyle(
                            color: kBlue,
                            fontFamily: 'OpenSans-Regular'),
                      ),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),
                    CupertinoDialogAction(
                      isDefaultAction: true,
                      child: Text(
                        "Yes",
                        style: TextStyle(
                            fontFamily: 'OpenSans-SemiBold',
                            color: kBlue),
                      ),
                      onPressed: (){
                        context.read<Data>().removeData();
                        Navigator.pushNamed(context, '/');
                      },
                    )
                  ],
                ),
                  data: ThemeData.dark(),
                ));
          },
          icon: Icon(
            CupertinoIcons.delete,
            size: 28.0,
          ))
    ],
  );
}
