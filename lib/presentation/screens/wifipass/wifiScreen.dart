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
  bool visible=false;
  bool enabled=true;
  int passwordPosition=0;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    var textFieldController = TextEditingController();
    String pass = '';
    return Scaffold(
        backgroundColor: kPersonalDarkGrey,
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
                        color: kPersonalWhite,
                        fontSize: 32,
                        fontFamily: 'OpenSans-SemiBold',
                        fontWeight: FontWeight.w600
                    ),
                  )
                ],
              ),
            ),
            Visibility(
              visible: visible,
              child: ResultCard(isUnique:visible,passwordPosition: passwordPosition),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Visibility(
                      visible: passwordPosition==0,
                      child: Row(
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
                              str.isNotEmpty ? enabled=true : enabled=false;
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
          decoration: BoxDecoration(
              color: kPersonalDarkGrey,
              border: Border(top: BorderSide(color: kPersonalDarkGrey,width: 3))
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15,bottom: height*0.03),
            child: Stack(
              children: [
                Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color:kPersonalBlue
                    ),
                    child: TextButton(
                        onPressed: () async {
                          String fileText = await rootBundle.loadString(
                              'assets/passwords/passes.txt');
                          enabled&&pass.isNotEmpty?  setState((){
                        passwordPosition=0;
                        visible=false;
                        passwordPosition = compare(fileText, pass,passwordPosition);
                        textFieldController.clear();
                        visible=checkPosition(passwordPosition);
                      })
                      : enabled=false;
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

class ResultCard extends StatelessWidget {
  final isUnique;
  final passwordPosition;
  ResultCard({required this.isUnique, this.passwordPosition});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Container(
          width: double.infinity,
          height: 57,
          decoration: BoxDecoration(
              color: isUnique&&passwordPosition!=-1
                  ? Color(0xFFFF453A)
                  : Color(0xFF32D74B),
              borderRadius: BorderRadius.circular(10)
          ),
          child: Center(
            child: Text(
              isUnique && passwordPosition!=-1
                  ? 'Your password is the $passwordPosition-th by the \nnumber of uses'
                  :'Your password is unique!',
              overflow: TextOverflow.fade,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'OpenSans-Regualar',
                  fontWeight: FontWeight.w600,
                  color: kPersonalWhite
              ),
            ),
          ),
        ),
      ),
    );
  }
}