import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/src/provider.dart';
import 'package:wifi_speed_test/Data/resultData.dart';
import 'package:wifi_speed_test/presentation/components/main/startBtn.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';
import 'package:device_information/device_information.dart';
import 'package:dio/dio.dart';
import 'package:dart_ipify/dart_ipify.dart';

class StartScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TestScreen();
  }
}

class _TestScreen extends State<StartScreen> {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  var dio = Dio();
  var temp;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  @override
  void initState() {
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
      dataSet();
    } on PlatformException catch (e) {
      print(e.toString());
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }
    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState((){
      _connectionStatus = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkGrey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: const Text(
            'Speed Test',
          style: TextStyle(
            fontSize: 28.0,
            fontFamily: 'OpenSans-SemiBold',
            fontWeight: FontWeight.w600
          )
        ),
        backgroundColor: kDarkGrey,
      ),
      body: Center(
          child: _connectionStatus != ConnectivityResult.none  ? StartButton(onPressed: (){
            setState((){
              Navigator.pushNamed(context, '/speedtest');
            });
          }) : Text('no internet connection')
      )
    );
  }
  dataSet() async {
    var suffix = context.read<Data>();
    suffix.ip=await Ipify.ipv4();
    suffix.device=await DeviceInformation.deviceModel;
    final response = await dio.get('http://ip-api.com/json/${context.read<Data>().ip}');
    suffix.isp=response.data['isp'];
  }
}

