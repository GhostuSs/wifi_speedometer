import 'dart:ui';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_speed_test/internet_speed_test.dart';
import 'package:internet_speed_test/callbacks_enum.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:wifi_speed_test/Data/resultData.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';
import 'package:wifi_speed_test/presentation/screens/constants/testServer.dart';
import 'package:provider/provider.dart';
import 'package:wifi_speed_test/presentation/screens/test/resultScreen.dart';
class SpeedTest extends StatefulWidget {
  @override
  _SpeedTestState createState() => _SpeedTestState();
}

class _SpeedTestState extends State<SpeedTest> {
  @override
  void initState() {
    super.initState();
    if (!isTesting) {
      setState(() {
        isTesting = true;
      });
      internetSpeedTest.startDownloadTesting(
        onDone: (double transferRate, SpeedUnit unit) {
          setState((){
            downloadRate = transferRate;
            protectGauge(downloadRate);
          });
          internetSpeedTest.startUploadTesting(
            onDone: (double transferRate, SpeedUnit unit) {
              setState(() async {
                context.read<Data>().downloadRate=downloadRate.round();
                uploadRate = transferRate;
                protectGauge(uploadRate);
                isTesting = false;
                context.read<Data>().uploadRate=uploadRate.round();
                await Future.delayed(Duration(seconds: 1));
                Navigator.push(context, PageTransition(child: ResultScreen(), type: PageTransitionType.leftToRight));
              });
            },
            onProgress: (double percent, double transferRate,
                SpeedUnit unit) {
              setState(() {
                uploadRate = transferRate;
                protectGauge(uploadRate);
                unitText =
                unit == SpeedUnit.Kbps ? 'Kb/s' : 'Mb/s';
              });
            },
            onError:
                (String errorMessage, String speedTestError) {
              showError(
                  'Upload test failed! Please check your internet connection.');
              setState(() {
                isTesting = false;
              });
            },
            testServer: uploadServer,
            fileSize: 10000000,
          );
        },
        onProgress: (double percent, double transferRate,
            SpeedUnit unit) {
          setState(() {
            downloadRate = transferRate;
            protectGauge(downloadRate);
            unitText = unit == SpeedUnit.Kbps ? 'Kb/s' : 'Mb/s';
          });
        },
        onError: (String errorMessage, String speedTestError) {
          showError(
              'Download test failed! Please check your internet connection.');
          setState(() {
            isTesting = false;
          });
        },
        testServer: downloadServer,
        fileSize: 20000000,
      );
    }
  }
  final internetSpeedTest = InternetSpeedTest();
  double downloadRate = 0;
  double uploadRate = 0;
  double displayRate = 0;
  String unitText = 'Mb/s';
  var downloadText='-';

  bool isTesting = false;

  void protectGauge(double rate) {
      displayRate = rate;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.0,
          title: Padding(
            padding: EdgeInsets.only(top: 25),
            child: Text(
                'Speed Test',
                style: TextStyle(
                    fontSize: 28.0,
                    fontFamily: 'OpenSans-SemiBold',
                    fontWeight: FontWeight.w600
                )
            ),
          ),
          backgroundColor: kDarkGrey,
        ),
        backgroundColor: kDarkGrey,
        body: body(),
      );
  }
  void showError(String eMsg) {
    Fluttertoast.showToast(
        msg: eMsg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: kWhite,
        fontSize: 16.0);
  }
  Widget body()=>Center(
      child: Column(
          mainAxisSize:MainAxisSize.min,
          children: [
            SizedBox(height: 35),
            Expanded(
              child: AspectRatio(
                aspectRatio: 19/9,
                child: Container(
                  child: SfRadialGauge(
                      enableLoadingAnimation: true,
                      animationDuration: 800,
                      axes: <RadialAxis>[
                        RadialAxis(
                            showLabels: false,
                            showTicks: false,
                            axisLineStyle: AxisLineStyle(
                              color: kLightGrey.withOpacity(0.1),
                              thickness: 25,
                              cornerStyle: CornerStyle.bothCurve,
                            ),
                            minimum: 0,
                            maximum: 300,
                            annotations: [
                              GaugeAnnotation(
                                  widget:Padding(
                                    padding: EdgeInsets.only(left: 25.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(200),
                                          gradient: RadialGradient(
                                              radius: 0.15,
                                              colors: [kBlue.withOpacity(0.15),kDarkGrey.withOpacity(0.1)]
                                          )
                                      ),
                                      height: MediaQuery.of(context).size.height*0.4,
                                      width: MediaQuery.of(context).size.width*0.8,
                                    ),
                                  )
                              ),
                              GaugeAnnotation(
                                widget: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                          '${displayRate.round()}',
                                          style: TextStyle(
                                              color: kWhite,
                                              fontSize: 32,
                                              fontFamily:'OpenSans-Regular',
                                              fontWeight: FontWeight.w600
                                          )
                                      ),
                                      Text(
                                          'Mbps',
                                          style: TextStyle(
                                              color: kBlue,
                                              fontSize: 18,
                                              fontFamily: 'OpenSans-Regular'
                                          )
                                      )
                                    ]
                                ),
                                positionFactor: 0.9,
                                angle: 90,

                              )
                            ],
                            pointers: [
                              NeedlePointer(
                                value: displayRate,
                                enableAnimation: true,
                                needleColor: kBlue,
                                needleStartWidth: 1.2,
                                needleEndWidth: 4.7,
                                needleLength: 0.65,
                                knobStyle: KnobStyle(
                                  color: kBlue,
                                ),
                              ),
                              RangePointer(
                                value: displayRate,
                                width: 25,
                                enableAnimation: true,
                                color: kBlue,
                                cornerStyle: CornerStyle.bothCurve,
                              ),
                            ]),
                      ]
                  ),
                ),
              ),
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 19/9,
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05,left: 35,right: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'download:'.toUpperCase(),
                                style: TextStyle(
                                    color: kWhite,
                                    fontSize: 18,
                                    fontFamily:'OpenSans-SemiBold',
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                        downloadRate==0 ?'-':'${downloadRate.round()} ',
                                        style: TextStyle(
                                            color: kWhite,
                                            fontSize: 36,
                                            fontFamily: 'OpenSans-Bold',
                                            fontWeight: FontWeight.bold
                                        )
                                    ),
                                    downloadRate == 0  ? Text('') : Padding(
                                      padding: EdgeInsets.only(bottom: 4.5 ),
                                      child: Text(
                                          'Mbps',
                                          style: TextStyle(
                                            color: kBlue,
                                            fontSize: 16,
                                            fontFamily: 'OpenSans-Regular',
                                          )
                                      ),
                                    )
                                  ]
                              )
                            ]
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'upload:'.toUpperCase(),
                                style: TextStyle(
                                    color: kWhite,
                                    fontSize: 18,
                                    fontFamily: 'OpenSans-SemiBold',
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                        uploadRate == 0  ?'-':'${uploadRate.round()} ',
                                        style: TextStyle(
                                            color: kWhite,
                                            fontSize: 36,
                                            fontWeight: FontWeight.bold
                                        )
                                    ),
                                    uploadRate == 0  ? Text('') : Padding(
                                      padding: EdgeInsets.only(bottom: 4.5 ),
                                      child: Text(
                                          'Mbps',
                                          style: TextStyle(
                                              color: kBlue,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal
                                          )
                                      ),
                                    )
                                  ]
                              )
                            ]
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]
      )
  );
}
