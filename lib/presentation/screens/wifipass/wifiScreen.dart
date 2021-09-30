import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wifi_speed_test/presentation/components/wifiPass/button.dart';
import 'package:wifi_speed_test/presentation/components/wifiPass/resultCard.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';

class WifiScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _WifiScreen();
  }
}

class _WifiScreen extends State<WifiScreen>{
  bool uniqueness=false;
  int passwordPosition=0;
  var textFieldController = TextEditingController();
  String pass = '';
  BtnState state=BtnState.notReady;
  CardState cardState = CardState.label;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    return SafeArea(
      top: false,
      maintainBottomViewPadding: true,
        child: Scaffold(
      backgroundColor: kDarkGrey,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Stack(
          children: [
            Button(state, onPressed),
            SizedBox(height: height * 0.1)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: height * 0.1, bottom: height * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Wi-Fi Pass',
                  style: TextStyle(
                      color: kWhite,
                      fontSize: 32,
                      fontFamily: 'OpenSans-SemiBold',
                      fontWeight: FontWeight.w500
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
                  ResultCard(state: cardState, isUnique: uniqueness,passwordPosition: passwordPosition),
                  SizedBox(height: height * 0.01),
                  Container(
                    height: 56,
                    decoration: BoxDecoration(
                        color: kLightGrey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: TextField(
                        controller: textFieldController,
                        autofocus: false,
                        style: TextStyle(
                            color: kWhite,
                            fontSize: 16.0,
                            fontFamily: 'OpenSans-Regular'
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,

                        ),
                        cursorColor: kBlue,
                        autocorrect: false,
                        onChanged: (str) {
                          pass = str;
                          setState(() {
                            pass.isNotEmpty ? state=BtnState.ready : state=BtnState.notReady;
                          });
                          },
                        onEditingComplete: (){
                          setState(() {
                            pass.isNotEmpty ? state=BtnState.ready : state=BtnState.notReady;
                          });
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
    )
    );
  }
  onPressed() async {
    String fileText = await rootBundle.loadString(
        'assets/passwords/passes.txt');
    pass.isNotEmpty ?  setState((){
      passwordPosition=0;
      uniqueness=false;
      passwordPosition = compare(fileText, pass,passwordPosition);
      pass='';
      textFieldController.clear();
      uniqueness=checkPosition(passwordPosition);
      state=BtnState.notReady;
      cardState=CardState.card;

    })
    : setState((){
      state=BtnState.notReady;
      cardState=CardState.label;
    });
  }
  int compare(String fileText, String compareString,int counter) {
    String basis = '';
    bool flag=false;
    int rowNum = 0;
    for (int i = 0; i < fileText.length; i++) {
      if (fileText[i] != '\n') {
        basis += fileText[i];
      } else {
        rowNum++;
        if (compareString == basis) {
          counter=rowNum;
          flag=true;
          break;
        }
        else
          {
          basis = '';
        }
      }
    }
    if(rowNum==4800 && flag!=true) counter=-1;
    return counter;
  }
  bool checkPosition(int pos){
    bool flag=false;
    pos>0 ? flag=true : flag=false;
    if(pos== -1)flag=true;
    return flag;
  }
}


