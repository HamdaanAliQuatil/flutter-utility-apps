// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../data/http_helper.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({ Key? key }) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather'),),
      body: Column(children: [
        ElevatedButton(child: Text('Get Data'),
        onPressed: getData,
        ),
        Text(result),
      ],
      ),
    );
  }

  Future getData() async{
    HttpHelper helper = HttpHelper();
    result = await helper.getWeather('Delhi');
    setState(() {
      
    });
  }

}

