// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:footer_mgnregs/screens/dashboard.dart';
import 'package:footer_mgnregs/screens/intro_screen.dart';
import 'package:footer_mgnregs/screens/weather_screen.dart';

void main() {
  runApp(GlobeApp());
}

class GlobeApp extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  GlobeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      routes: {
        '/':(context) => Dashboard(),
        '/scan':(context) => Scan(),
        '/weather':(context) => WeatherScreen(),
      },
      );
  }
}

