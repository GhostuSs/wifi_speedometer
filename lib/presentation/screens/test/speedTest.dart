import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_speed_test/internet_speed_test.dart';
import 'package:internet_speed_test/callbacks_enum.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:wifi_speed_test/Data/resultData.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';
import 'package:wifi_speed_test/presentation/screens/constants/testServer.dart';
import 'package:provider/provider.dart';
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
          setState(() {
            downloadRate = transferRate;
            protectGauge(downloadRate);
            unitText = unit == SpeedUnit.Kbps ? 'Kb/s' : 'Mb/s';
          });
          internetSpeedTest.startUploadTesting(
            onDone: (double transferRate, SpeedUnit unit) {
              setState(() async {
                uploadRate = transferRate;
                uploadRate = uploadRate * 10;
                protectGauge(uploadRate);
                unitText =
                unit == SpeedUnit.Kbps ? 'Kb/s' : 'Mb/s';
                isTesting = false;
                context.read<Data>().downloadRate=downloadRate.round();
                context.read<Data>().uploadRate=uploadRate.round();
                await Future.delayed(const Duration(seconds: 1,milliseconds: 500));
                Navigator.pushNamed(context, '/results');
              });
            },
            onProgress: (double percent, double transferRate,
                SpeedUnit unit) {
              setState(() {
                uploadRate = transferRate;
                uploadRate = uploadRate * 10;
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
            fileSize: 20000000,
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

  bool isTesting = false;

  void protectGauge(double rate) {
      displayRate = rate;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPersonalDarkGrey,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SfRadialGauge(
                enableLoadingAnimation: true,
                animationDuration: 500,
                axes: <RadialAxis>[
                  RadialAxis(
                      showLabels: false,
                      showTicks: false,
                      axisLineStyle: AxisLineStyle(
                        color: kPersonalLightGrey.withOpacity(0.25),
                        thickness: 25,
                        cornerStyle: CornerStyle.bothCurve,
                      ),
                      minimum: 0,
                      maximum: 150,
                      annotations: [
                          GaugeAnnotation(
                              widget:Padding(
                                padding: EdgeInsets.only(left: 25.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(200),
                                      gradient: RadialGradient(
                                          radius: 0.15,
                                          colors: [kPersonalBlue.withOpacity(0.15),kPersonalDarkGrey.withOpacity(0.1)]
                                      )
                                  ),
                                  height: MediaQuery.of(context).size.height*0.4,
                                  width: MediaQuery.of(context).size.width*0.8,
                                ),
                              )
                          ),
                        ],
                      pointers: <GaugePointer>[
                        NeedlePointer(
                          value: displayRate,
                          enableAnimation: true,
                          needleColor: kPersonalBlue,
                          needleStartWidth: 1.2,
                          needleEndWidth: 4.7,
                          needleLength: 0.65,
                          knobStyle: KnobStyle(
                            color: kPersonalBlue,
                          ),
                        ),
                        RangePointer(
                            value: displayRate,
                            width: 25,
                            enableAnimation: true,
                            color: kPersonalBlue,
                            cornerStyle: CornerStyle.bothCurve)
                      ]),
                ]
            ),
            Column(
              children: [
              Text(
                  '${displayRate.round()}',
                  style: TextStyle(
                      color: kPersonalWhite,
                      fontSize: 32,
                      fontFamily:'OpenSans-Regular',
                      fontWeight: FontWeight.w600
                  )
              ),
                Text(
                    'Mbps',
                    style: TextStyle(
                        color: kPersonalBlue,
                        fontSize: 18,
                        fontFamily: 'OpenSans-Regular'
                    )
                )
            ]
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'download:'.toUpperCase(),
                        style: TextStyle(
                            color: kPersonalWhite,
                            fontSize: 18,
                            fontFamily:'OpenSans-SemiBold',
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                                downloadRate == 0 ?'-':'${downloadRate.round()} ',
                                style: TextStyle(
                                    color: kPersonalWhite,
                                    fontSize: 36,
                                    fontFamily: 'OpenSans-Bold',
                                    fontWeight: FontWeight.bold
                                )
                            ),
                            downloadRate == 0 ? Text('') : Padding(
                                padding: EdgeInsets.only(bottom: 4.5 ),
                              child: Text(
                                  'Mbps',
                                  style: TextStyle(
                                      color: kPersonalBlue,
                                      fontSize: 16,
                                      fontFamily: 'OpenSans-Regular',
                                  )
                              ),
                            )
                          ]
                      )
                    ]
                )
                ),
                Padding(
                    padding: EdgeInsets.only(right: 30),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'upload:'.toUpperCase(),
                            style: TextStyle(
                                color: kPersonalWhite,
                                fontSize: 18,
                                fontFamily: 'OpenSans-SemiBold',
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                    uploadRate == 0 ?'-':'${uploadRate.round()} ',
                                    style: TextStyle(
                                        color: kPersonalWhite,
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold
                                    )
                                ),
                                uploadRate == 0 ? Text('') : Padding(
                                  padding: EdgeInsets.only(bottom: 4.5 ),
                                  child: Text(
                                      'Mbps',
                                      style: TextStyle(
                                          color: kPersonalBlue,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal
                                      )
                                  ),
                                )
                              ]
                          )
                        ]
                    )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  void showError(String eMsg) {
    Fluttertoast.showToast(
        msg: eMsg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: kPersonalWhite,
        fontSize: 16.0);
  }
}
