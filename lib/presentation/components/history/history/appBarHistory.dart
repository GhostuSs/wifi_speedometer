import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wifi_speed_test/Data/historyData.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';

PreferredSizeWidget appBarHistory(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0.0,
    toolbarHeight: 80,
    backgroundColor: kDarkGrey,
    title: Text(
      'History',
      style: TextStyle(
          color: kWhite,
          fontSize: 28.0,
          fontFamily: 'OpenSans-SemiBold',
          fontWeight: FontWeight.w500),
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
                      "Clear history?",
                      style: TextStyle(
                          fontFamily: 'OpenSans-SemiBold',
                          color: kWhite),
                    ),
                    content: Text(
                      "Are you sure you want to delete this results?",
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
                        onPressed: () async {
                          await clearList();
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
