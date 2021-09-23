import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';

class WifiScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _WifiScreen();
  }
}

class _WifiScreen extends State<WifiScreen> {
  @override
  Widget build(BuildContext context) {
    var color = kPersonalLightGrey;
    final height = MediaQuery
        .of(context)
        .size
        .height;
    int passwordPosition = 0;
    var textFieldController = TextEditingController();
    String pass = '';
    return Scaffold(
        backgroundColor: kPersonalDarkGrey,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: height * 0.1, bottom: height * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Wi-Fi Pass',
                    style: TextStyle(
                        color: kPersonalWhite,
                        fontSize: 32,
                        fontFamily: 'OpenSans-SemiBold',
                        fontWeight: FontWeight.w600
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      children: [
                        Text(
                          ' Find how often your Wi-Fi password is used',
                          style: TextStyle(
                              color: kPersonalLightGrey,
                              fontFamily: 'OpenSans-Regular',
                              fontSize: 14
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.01),
                    Container(
                      height: 56,
                      decoration: BoxDecoration(
                          color: kPersonalLightGrey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: TextField(
                          controller: textFieldController,
                          style: TextStyle(
                              color: kPersonalWhite,
                              fontSize: 16.0,
                              fontFamily: 'OpenSans-Regular'
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,

                          ),
                          cursorColor: kPersonalBlue,
                          autocorrect: false,
                          onChanged: (str) {
                            pass = str;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomSheet: Container(
          color: kPersonalDarkGrey,
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: textFieldController.text.isEmpty ? kPersonalLightGrey : kPersonalBlue
                    ),
                    child: TextButton(onPressed: () async {
                      String fileText = await rootBundle.loadString(
                          'assets/passwords/passes.txt');
                      passwordPosition = compare(fileText, pass);
                      textFieldController.clear();
                    },
                        child: Text(
                          'Find out'.toUpperCase(),
                          style: TextStyle(
                              color: kPersonalWhite,
                              fontSize: 18.0,
                              fontFamily: 'OpenSans-Regular',
                              fontWeight: FontWeight.bold
                          ),
                        )
                    )
                ),
                SizedBox(height: height * 0.03)
              ],
            ),
          ),
        )
    );
  }
  int compare(String fileText, String compareString) {
    String basis = '';
    int rowNum = 0;
    for (int i = 0; i < fileText.length; i++) {
      if (fileText[i] != '\n') {
        basis += fileText[i];
      } else {
        rowNum++;
        if (compareString == basis) {
          break;
        } else {
          basis = '';
        }
      }
    }
    return rowNum;
  }
}