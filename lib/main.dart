import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wifi_speed_test/routes.dart';
import 'Data/resultData.dart';

void main() => runApp(
    MultiProvider(
      providers: [
        Provider<Data>(create: (_) => Data()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: "/",
          routes: routes
      ),
    )
);