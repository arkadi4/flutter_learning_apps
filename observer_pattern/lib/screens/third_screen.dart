

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:observer_pattern/weather_observer/weather_observer.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {

  void update() {
    WeatherObserver().updateTime();
    setState(() {

    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Third screen'),
            Text('time ${WeatherObserver().time}'),
            Text('timeSinceEpoch ${WeatherObserver().timeSinceEpoch % 35}'),
            ElevatedButton(onPressed: update, child: Text('update time')),
            ElevatedButton(onPressed: WeatherObserver().createTimerWith5SecondsUpdate, child: Text('create Timer')),
            ElevatedButton(onPressed: WeatherObserver().cancelTimer, child: Text('cancel Timer')),
          ],
        ),

      ),
    );
  }
}