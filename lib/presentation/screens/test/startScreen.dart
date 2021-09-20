import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wifi_speed_test/presentation/components/startBtn.dart';
import 'package:wifi_speed_test/presentation/screens/constants/colorPallette.dart';

class StartScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TestScreen();
  }
}

class _TestScreen extends State<StartScreen> {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
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
    setState(() {
      _connectionStatus = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPersonalDarkGrey,
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
            'Speed Test',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w600
          )
        ),
        backgroundColor: kPersonalDarkGrey,
      ),
      body: Center(
          child: _connectionStatus != ConnectivityResult.none  ? StartButton(onPressed: (){
            setState(() {
              Navigator.pushNamed(context, '/speedtest');
            });
          }) : Text('')
      )
    );
  }
}



