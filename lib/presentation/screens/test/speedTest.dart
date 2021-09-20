import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_speed_test/internet_speed_test.dart';
import 'package:internet_speed_test/callbacks_enum.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';
import 'package:wifi_speed_test/presentation/screens/constants/testServer.dart';

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
              setState(() {
                uploadRate = transferRate;
                uploadRate = uploadRate * 10;
                protectGauge(uploadRate);
                unitText =
                unit == SpeedUnit.Kbps ? 'Kb/s' : 'Mb/s';
                isTesting = false;
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
    if (rate > 150) {
    } else {
      displayRate = rate;
    }
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
                axes: <RadialAxis>[
                  RadialAxis(
                      showLabels: false,
                      showTicks: false,
                      axisLineStyle: AxisLineStyle(
                        color: kPersonalBlue,
                        thickness: 25,
                        cornerStyle: CornerStyle.bothCurve,
                      ),
                      minimum: 0,
                      maximum: 150,
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
                        )
                      ])
                ]),
            Column(
              children: [
              Text(
                  '${downloadRate.round()}',
                  style: TextStyle(
                      color: kPersonalWhite,
                      fontSize: 32,
                      fontWeight: FontWeight.w600
                  )
              ),
                Text(
                    'Mbps',
                    style: TextStyle(
                        color: kPersonalBlue,
                        fontSize: 18,
                        fontWeight: FontWeight.w600
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
                                      fontWeight: FontWeight.normal
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
